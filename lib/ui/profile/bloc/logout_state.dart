import 'package:equatable/equatable.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_state.dart';

class LogoutState extends BaseState {
  final bool isLoggedOut;
  final String? errorMessage;

  const LogoutState({
    this.isLoggedOut = false,
    this.errorMessage,
  }) : super();

  LogoutState copyWith({
    bool? isLoggedOut,
    String? errorMessage,
  }) {
    return LogoutState(
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoggedOut, errorMessage];
}
