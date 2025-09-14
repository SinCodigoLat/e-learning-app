import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/base/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_bloc_template/domain/use_case/auth/logout_use_case.dart';
import 'package:injectable/injectable.dart';

import 'logout_event.dart';
import 'logout_state.dart';

@injectable
class LogoutBloc extends BaseBloc<LogoutEvent, LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutBloc(this._logoutUseCase) : super(LogoutState()) {
    on<LogoutRequestedEvent>(_onLogoutRequestedEvent);
  }

  Future<void> _onLogoutRequestedEvent(LogoutRequestedEvent event, Emitter<LogoutState> emit) async {
    return runAction(
      onAction: () async {
        try {
          // Simulate logout process
          await Future.delayed(const Duration(seconds: 1));
          
          // For now, just simulate successful logout
          // In a real app, you would clear tokens, user data, etc.
          emit(state.copyWith(isLoggedOut: true));
          
          // TODO: Implement actual logout logic
          // final result = await _logoutUseCase.invoke(null);
          // result.when(
          //   ok: (data) {
          //     emit(state.copyWith(isLoggedOut: true));
          //   },
          //   failure: (error) {
          //     emit(state.copyWith(errorMessage: error.message));
          //   },
          // );
        } catch (e) {
          emit(state.copyWith(errorMessage: e.toString()));
        }
      },
    );
  }
}
