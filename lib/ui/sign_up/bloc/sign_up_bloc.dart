import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/domain/use_case/auth/sign_up_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:e_learning_app/base/helper/log.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

@injectable
class SignUpBloc extends BaseBloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(this._signUpUseCase) : super(const SignUpState()) {
    on<SignUpEmailChangedEvent>(_onSignUpEmailChangedEvent);
    on<SignUpPasswordChangedEvent>(_onSignUpPasswordChangedEvent);
    on<SignUpFullNameChangedEvent>(_onSignUpFullNameChangedEvent);
    on<SignUpSubmittedEvent>(_onSignUpSubmittedEvent);
  }

  Future<void> _onSignUpEmailChangedEvent(
      SignUpEmailChangedEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(email: event.value));
  }

  FutureOr<void> _onSignUpPasswordChangedEvent(
      SignUpPasswordChangedEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(password: event.value));
  }

  FutureOr<void> _onSignUpFullNameChangedEvent(
      SignUpFullNameChangedEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(fullName: event.value));
  }

  FutureOr<void> _onSignUpSubmittedEvent(
      SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
    CoreLog.i('🎯 SignUpBloc._onSignUpSubmittedEvent called');
    CoreLog.i('🎯 Current state - Email: ${state.email}');
    CoreLog.i('🎯 Current state - Full Name: ${state.fullName}');
    CoreLog.i('🎯 Current state - Password length: ${state.password.length}');

    emit(state.copyWith(isLoading: true, errorMessage: null));
    CoreLog.i('🎯 State updated to loading: true');

    CoreLog.i('🎯 Calling _signUpUseCase.invoke...');
    final result = await _signUpUseCase.invoke(
      email: state.email,
      password: state.password,
      fullName: state.fullName,
    );

    CoreLog.i('🎯 SignUpUseCase result received');
    result.when(
      ok: (data) {
        CoreLog.i('🎯 Sign up successful!');
        if (data != null) {
          CoreLog.i('🎯 AuthEntity ID: ${data.id}');
          CoreLog.i('🎯 AuthEntity Email: ${data.email}');
          CoreLog.i('🎯 AuthEntity Name: ${data.name}');
        } else {
          CoreLog.i('🎯 AuthEntity is null!');
        }
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
        ));
        CoreLog.i('🎯 State updated to success: true');
      },
      failure: (error) {
        CoreLog.e('🎯 Sign up failed!');
        CoreLog.e('🎯 Error: $error');
        emit(state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ));
        CoreLog.e('🎯 State updated with error message');
      },
    );
  }
}
