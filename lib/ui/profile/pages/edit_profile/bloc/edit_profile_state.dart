import 'package:e_learning_app/base/bloc/base_bloc/base_state.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/ui/profile/pages/edit_profile/utils/name_input.dart';

import '../utils/email_input.dart';

final class EditProfileState extends BaseState {
  final NameInput nameInput;
  final EmailInput emailInput;
  final UserEntity user;
  final DateTime selectedBirthday;
  final Gender? selectedGender;
  final bool isUpdating;
  final bool isUpdateSuccess;
  final String? updateErrorMessage;

  EditProfileState({
    required this.nameInput,
    required this.emailInput,
    required this.user,
    required this.selectedBirthday,
    this.selectedGender,
    this.isUpdating = false,
    this.isUpdateSuccess = false,
    this.updateErrorMessage,
  });

  EditProfileState copyWith({
    NameInput? nameInput,
    EmailInput? emailInput,
    UserEntity? user,
    DateTime? selectedBirthday,
    Gender? selectedGender,
    bool? isUpdating,
    bool? isUpdateSuccess,
    String? updateErrorMessage,
  }) {
    return EditProfileState(
      nameInput: nameInput ?? this.nameInput,
      emailInput: emailInput ?? this.emailInput,
      user: user ?? this.user,
      selectedBirthday: selectedBirthday ?? this.selectedBirthday,
      selectedGender: selectedGender ?? this.selectedGender,
      isUpdating: isUpdating ?? this.isUpdating,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      updateErrorMessage: updateErrorMessage ?? this.updateErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        nameInput,
        emailInput,
        user,
        selectedBirthday,
        selectedGender,
        isUpdating,
        isUpdateSuccess,
        updateErrorMessage,
      ];
}
