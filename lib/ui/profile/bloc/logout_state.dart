import 'package:equatable/equatable.dart';

class LogoutState extends Equatable {
  final bool isLoggedOut;
  final String? errorMessage;

  const LogoutState({
    this.isLoggedOut = false,
    this.errorMessage,
  });

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
