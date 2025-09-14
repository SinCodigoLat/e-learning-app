import 'package:e_learning_app/base/bloc/base_bloc/base_state.dart';

class SignUpState extends BaseState {
  final String email;
  final String password;
  final String fullName;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const SignUpState({
    this.email = '',
    this.password = '',
    this.fullName = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  SignUpState copyWith({
    String? email,
    String? password,
    String? fullName,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, fullName, isLoading, isSuccess, errorMessage];
}
