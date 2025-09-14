import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/domain/use_case/auth/logout_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:e_learning_app/base/helper/log.dart';

import 'logout_event.dart';
import 'logout_state.dart';

@lazySingleton
class LogoutBloc extends BaseBloc<LogoutEvent, LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutBloc(this._logoutUseCase) : super(LogoutState()) {
    on<LogoutRequestedEvent>(_onLogoutRequestedEvent);
  }

  Future<void> _onLogoutRequestedEvent(
      LogoutRequestedEvent event, Emitter<LogoutState> emit) async {
    CoreLog.i('🚪 LogoutBloc._onLogoutRequestedEvent called');

    return runAction(
      onAction: () async {
        try {
          CoreLog.i('🚪 Starting logout process...');

          final result = await _logoutUseCase.invoke(null);

          CoreLog.i('🚪 LogoutUseCase result received');
          result.when(
            ok: (data) {
              CoreLog.i('🚪 Logout successful!');
              emit(state.copyWith(isLoggedOut: true));
            },
            failure: (error) {
              CoreLog.e('🚪 Logout failed!');
              CoreLog.e('🚪 Error: $error');
              emit(state.copyWith(errorMessage: error.toString()));
            },
          );
        } catch (e, stackTrace) {
          CoreLog.e('🚪 Logout error in LogoutBloc');
          CoreLog.e('🚪 Error: $e');
          CoreLog.e('🚪 Stack trace: $stackTrace');
          emit(state.copyWith(errorMessage: e.toString()));
        }
      },
    );
  }
}
