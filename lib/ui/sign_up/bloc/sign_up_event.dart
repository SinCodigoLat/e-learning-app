import 'package:equatable/equatable.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';

abstract class SignUpEvent extends BaseEvent {
  const SignUpEvent();
}

class SignUpEmailChangedEvent extends SignUpEvent {
  final String value;

  const SignUpEmailChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String value;

  const SignUpPasswordChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SignUpFullNameChangedEvent extends SignUpEvent {
  final String value;

  const SignUpFullNameChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SignUpSubmittedEvent extends SignUpEvent {
  const SignUpSubmittedEvent();
}
