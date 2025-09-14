import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/use_case/user/fetch_profile_use_case.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_event.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/bloc/edit_profile_state.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/utils/email_input.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/utils/name_input.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileBloc extends BaseBloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._fetchProfileUseCase)
      : super(EditProfileState(
          nameInput: const NameInput.pure(),
          emailInput: const EmailInput.pure(),
          user: UserEntity.defaultValue(),
          selectedBirthday: UserEntity.defaultValue().birthday,
        )) {
    on<EditProfileDataRequestEvent>(_onEditProfileDataRequestEvent);
    on<ProfileNameChangedEvent>(_onProfileNameChangedEvent);
    on<ProfileEmailChangedEvent>(_onProfileEmailChangedEvent);
    on<ProfilePhoneNumberChangedEvent>(_onProfilePhoneNumberChangedEvent);
    on<ProfileBirthdayChangedEvent>(_onProfileBirthdayChangedEvent);
    on<ProfileGenderChangedEvent>(_onProfileGenderChangedEvent);
    on<UpdateProfileRequestEvent>(_onUpdateProfileRequestEvent);
  }

  final FetchProfileUseCase _fetchProfileUseCase;

  Future<void> _onEditProfileDataRequestEvent(
      EditProfileDataRequestEvent event, Emitter<EditProfileState> emit) async {
    return runAction(
      onAction: () async {
        final result = await _fetchProfileUseCase.invoke(null);
        result.when(
          ok: (data) {
            if (data != null) {
              print(
                  '🎂 EditProfileDataRequestEvent - data.birthday: ${data.birthday}');
              print(
                  '👤 EditProfileDataRequestEvent - data.gender: ${data.gender}');
              emit(state.copyWith(
                user: data,
                selectedBirthday: data.birthday,
                selectedGender: data.gender,
              ));
            } else {
              print(
                  '🎂 EditProfileDataRequestEvent - data is null, keeping current state');
            }
          },
          failure: (error) {
            print('🎂 EditProfileDataRequestEvent - error: $error');
          },
        );
      },
    );
  }

  FutureOr<void> _onProfilePhoneNumberChangedEvent(
      ProfilePhoneNumberChangedEvent event, Emitter<EditProfileState> emit) {}

  FutureOr<void> _onProfileEmailChangedEvent(
      ProfileEmailChangedEvent event, Emitter<EditProfileState> emit) {}

  FutureOr<void> _onProfileNameChangedEvent(
      ProfileNameChangedEvent event, Emitter<EditProfileState> emit) {
    final value = NameInput.dirty(event.value);
    emit(state.copyWith(nameInput: value));
  }

  FutureOr<void> _onProfileBirthdayChangedEvent(
      ProfileBirthdayChangedEvent event, Emitter<EditProfileState> emit) {
    print('🎂 ProfileBirthdayChangedEvent: ${event.value}');
    print('🎂 Current selectedBirthday: ${state.selectedBirthday}');
    emit(state.copyWith(selectedBirthday: event.value));
  }

  FutureOr<void> _onProfileGenderChangedEvent(
      ProfileGenderChangedEvent event, Emitter<EditProfileState> emit) {
    print('👤 ProfileGenderChangedEvent: ${event.value}');
    print('👤 Current selectedGender: ${state.selectedGender}');
    emit(state.copyWith(selectedGender: event.value));
  }

  FutureOr<void> _onUpdateProfileRequestEvent(
      UpdateProfileRequestEvent event, Emitter<EditProfileState> emit) {
    print('💾 UpdateProfileRequestEvent called');

    return runAction(
      onAction: () async {
        try {
          emit(state.copyWith(isUpdating: true, updateErrorMessage: null));

          // Simulate API call - replace with real update logic
          await Future.delayed(const Duration(seconds: 2));

          print('💾 Profile update successful');
          emit(state.copyWith(
            isUpdating: false,
            isUpdateSuccess: true,
            updateErrorMessage: null,
          ));
        } catch (e) {
          print('💾 Profile update failed: $e');
          emit(state.copyWith(
            isUpdating: false,
            isUpdateSuccess: false,
            updateErrorMessage: e.toString(),
          ));
        }
      },
    );
  }
}
