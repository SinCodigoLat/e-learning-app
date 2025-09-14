import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';

sealed class EditProfileEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

final class EditProfileDataRequestEvent extends EditProfileEvent {}

final class ProfileNameChangedEvent extends EditProfileEvent {
  final String value;

  ProfileNameChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

final class ProfileEmailChangedEvent extends EditProfileEvent {
  final String value;

  ProfileEmailChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

final class ProfilePhoneNumberChangedEvent extends EditProfileEvent {
  final String value;

  ProfilePhoneNumberChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

final class ProfileBirthdayChangedEvent extends EditProfileEvent {
  final DateTime value;

  ProfileBirthdayChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

final class ProfileGenderChangedEvent extends EditProfileEvent {
  final Gender value;

  ProfileGenderChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

final class UpdateProfileRequestEvent extends EditProfileEvent {
  UpdateProfileRequestEvent();

  @override
  List<Object?> get props => [];
}
