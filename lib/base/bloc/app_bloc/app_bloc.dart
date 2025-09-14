import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/app_bloc/app_event.dart';
import 'package:e_learning_app/base/bloc/app_bloc/app_state.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/domain/use_case/user/fetch_profile_use_case.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc(this._fetchProfileUseCase) : super(AppState()) {
    print('🚀 AppBloc - Constructor called');
    on<AppStartedEvent>(_onAppStartedEvent);
    on<UserLoggedInEvent>(_onUserLoggedInEvent);
    on<UserLoggedOutEvent>(_onUserLoggedOutEvent);
    on<LoadAppConfigEvent>(_onLoadAppConfigEvent);
    on<ConnectivityChangedEvent>(_onConnectivityChangedEvent);
    on<ThemeChangedEvent>(_onThemeChangedEvent);
    on<LanguageChangedEvent>(_onLanguageChangedEvent);
  }

  final FetchProfileUseCase _fetchProfileUseCase;

  Future<void> _onAppStartedEvent(
      AppStartedEvent event, Emitter<AppState> emit) async {
    print('🚀 AppBloc - _onAppStartedEvent called - METHOD ENTRY');
    print('🚀 AppBloc - Event received: ${event.loadAppConfig}');
    print(
        '🚀 AppBloc - App config: isLoggedIn=${event.loadAppConfig.isLoggedIn}, isFirstLaunch=${event.loadAppConfig.isFirstLaunchApp}');

    // Only load profile if user is logged in
    if (!event.loadAppConfig.isLoggedIn) {
      print('🚀 AppBloc - User not logged in, skipping profile load');
      return;
    }

    print('🚀 AppBloc - User is logged in, proceeding to load profile');

    return runAction(
      onAction: () async {
        print('🚀 AppBloc - Starting profile fetch process');
        final result = await _fetchProfileUseCase.invoke(null);
        result.when(
          ok: (data) {
            print('🚀 AppBloc - Profile loaded successfully!');
            print('🚀 AppBloc - User data:');
            print('🚀   - ID: ${data?.id}');
            print('🚀   - Full Name: ${data?.fullName}');
            print('🚀   - Email: ${data?.email}');
            print('🚀   - Avatar: ${data?.avatar}');
            print('🚀   - Phone: ${data?.phoneNumber}');
            print('🚀   - Bio: ${data?.bio}');
            print('🚀   - Location: ${data?.location}');
            print('🚀   - Gender: ${data?.gender}');
            print('🚀   - Birthday: ${data?.birthday}');
          },
          failure: (error) {
            print('🚀 AppBloc - Failed to load profile: $error');
            print('🚀 AppBloc - Error type: ${error.runtimeType}');
          },
        );
      },
      handleLoading: false,
    );
  }

  FutureOr<void> _onUserLoggedInEvent(
      UserLoggedInEvent event, Emitter<AppState> emit) async {
    print(
        '🚀 AppBloc - _onUserLoggedInEvent called with userId: ${event.userId}');

    return runAction(
      onAction: () async {
        print('🚀 AppBloc - User logged in, starting profile load');
        final result = await _fetchProfileUseCase.invoke(null);
        result.when(
          ok: (data) {
            print('🚀 AppBloc - Profile loaded after login successfully!');
            print('🚀 AppBloc - Post-login user data:');
            print('🚀   - ID: ${data?.id}');
            print('🚀   - Full Name: ${data?.fullName}');
            print('🚀   - Email: ${data?.email}');
            print('🚀   - Avatar: ${data?.avatar}');
            print('🚀   - Phone: ${data?.phoneNumber}');
            print('🚀   - Bio: ${data?.bio}');
            print('🚀   - Location: ${data?.location}');
            print('🚀   - Gender: ${data?.gender}');
            print('🚀   - Birthday: ${data?.birthday}');
          },
          failure: (error) {
            print('🚀 AppBloc - Failed to load profile after login: $error');
            print('🚀 AppBloc - Error type: ${error.runtimeType}');
          },
        );
      },
      handleLoading: false,
    );
  }

  FutureOr<void> _onUserLoggedOutEvent(
      UserLoggedOutEvent event, Emitter<AppState> emit) {}

  FutureOr<void> _onLoadAppConfigEvent(
      LoadAppConfigEvent event, Emitter<AppState> emit) {}

  FutureOr<void> _onConnectivityChangedEvent(
      ConnectivityChangedEvent event, Emitter<AppState> emit) {}

  FutureOr<void> _onThemeChangedEvent(
      ThemeChangedEvent event, Emitter<AppState> emit) {}

  FutureOr<void> _onLanguageChangedEvent(
      LanguageChangedEvent event, Emitter<AppState> emit) {}
}
