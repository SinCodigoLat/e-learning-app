import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/base/helper/duration_provider.dart';
import 'package:e_learning_app/domain/use_case/auth/login_use_case.dart';
import 'package:e_learning_app/ui/login/bloc/login_event.dart';
import 'package:e_learning_app/ui/login/bloc/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<LoginEmailChangedEvent>(_onLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_onLoginPasswordChangedEvent);
    onThrottle<LoginSubmittedEvent>(_onLoginSubmittedEvent,
        duration: const OneSecondDuration());
  }

  Future<void> _onLoginEmailChangedEvent(
      LoginEmailChangedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(email: event.value));
  }

  FutureOr<void> _onLoginPasswordChangedEvent(
      LoginPasswordChangedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.value));
  }

  FutureOr<void> _onLoginSubmittedEvent(
      LoginSubmittedEvent event, Emitter<LoginState> emit) {
    return runAction(
      onAction: () async {
        emit(state.copyWith(isLoading: true, errorMessage: null));

        final result = await _loginUseCase.invoke(LoginRequest(
          email: state.email,
          password: state.password,
        ));

        result.when(
          ok: (authEntity) {
            emit(state.copyWith(isLoading: false, isSuccess: true));
          },
          failure: (error) {
            emit(state.copyWith(
              isLoading: false,
              errorMessage: error.toString(),
            ));
          },
        );
      },
    );
  }
}
