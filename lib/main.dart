import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/app_bloc/app_bloc.dart';
import 'package:e_learning_app/base/constants/ui/app_theme.dart';
import 'package:e_learning_app/base/helper/log.dart';
import 'package:e_learning_app/config/environment.dart';
import 'package:e_learning_app/di/di.dart';
import 'package:e_learning_app/domain/entity/config/load_app_config_entity.dart';
import 'package:e_learning_app/domain/use_case/config/load_app_config_use_case.dart';
import 'package:e_learning_app/navigation/router.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'base/bloc/app_bloc/app_event.dart';
import 'base/shared_view/foundation_state.dart';
import 'base/utils/http_utils.dart';
import 'config/app_config.dart';
import 'navigation/app_router_observer.dart';
import 'resource/generated/l10n.dart';

Future<void> initApp({
  AsyncCallback beforeRun = _defaultBeforeRun,
  required AppEnvironment env,
  required bool enableLog,
}) async {
  print('🏁 AppInit - Starting app initialization');
  WidgetsFlutterBinding.ensureInitialized();
  CoreLog.enableLog = enableLog;
  HttpOverrides.global = MyHttpOverrides();
  SL.registerLazySingleton<EnvironmentConfigurable>(() => env);

  print('🏁 AppInit - Running beforeRun callback');
  await beforeRun.call();

  CoreLog.i('Starting app with environment: ${env.getBaseUrl()}');
  print('🏁 AppInit - Environment: ${env.getBaseUrl()}');

  final loadAppConfig = SL.get<LoadAppConfigUseCase>().invoke(null);
  print('🏁 AppInit - Load App config: $loadAppConfig');

  print('🏁 AppInit - Creating AppBloc and triggering AppStartedEvent');
  runApp(
    BlocProvider(
      create: (context) {
        final appBloc = SL.get<AppBloc>();
        print('🏁 AppInit - AppBloc created, adding AppStartedEvent');
        print('🏁 AppInit - AppBloc instance: ${appBloc.runtimeType}');
        print(
            '🏁 AppInit - Adding AppStartedEvent with config: $loadAppConfig');
        appBloc.add(AppStartedEvent(loadAppConfig));
        print('🏁 AppInit - AppStartedEvent added successfully');
        return appBloc;
      },
      child: _MyApp(config: loadAppConfig),
    ),
  );
  print('🏁 AppInit - App initialization completed');
}

Future<void> _defaultBeforeRun() async {
  print('🔧 BeforeRun - Starting Supabase initialization');

  // Initialize Supabase
  await Supabase.initialize(
    url: SL.get<EnvironmentConfigurable>().getSupabaseUrl(),
    anonKey: SL.get<EnvironmentConfigurable>().getSupabaseAnonKey(),
  );

  print('🔧 BeforeRun - Supabase initialized successfully');
  print(
      '🔧 BeforeRun - Supabase URL: ${SL.get<EnvironmentConfigurable>().getSupabaseUrl()}');

  // Then initialize app config
  print('🔧 BeforeRun - Initializing app config');
  await AppConfig.instance().init();
  print('🔧 BeforeRun - App config initialized successfully');
}

class _MyApp extends StatefulWidget {
  const _MyApp({required this.config});

  final LoadAppConfigEntity config;

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends FoundationState<_MyApp, AppBloc> {
  late final appRouter = SL.get<AppRouter>();

  @override
  bool get shouldUseApplicationWidget => true;

  @override
  Widget buildPage(BuildContext context) {
    return MaterialApp.router(
      title: SL.get<EnvironmentConfigurable>().getBrandName(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [AppRouterObserver()],
        deepLinkBuilder: (deepLink) => _handleDeepLinkBuilder(deepLink),
      ),
    );
  }

  FutureOr<DeepLink> _handleDeepLinkBuilder(PlatformDeepLink deepLink) async {
    late List<PageRouteInfo> routes;

    // Check if user is logged in with Supabase
    final user = Supabase.instance.client.auth.currentUser;
    print('🌐 MainApp - Deep link builder called');
    print('🌐 MainApp - Current Supabase user: ${user?.id} (${user?.email})');
    print(
        '🌐 MainApp - App config: isFirstLaunch=${widget.config.isFirstLaunchApp}, isLoggedIn=${widget.config.isLoggedIn}');

    if (widget.config.isFirstLaunchApp) {
      print('🌐 MainApp - First launch, routing to OnboardingRoute');
      routes = [const OnboardingRoute()];
    } else if (user != null) {
      // User is logged in, go to main page
      print('🌐 MainApp - User logged in, routing to MainRoute');
      routes = [const MainRoute()];
    } else {
      // User is not logged in, go to login page
      print('🌐 MainApp - User not logged in, routing to LoginRoute');
      routes = [const LoginRoute()];
    }

    print(
        '🌐 MainApp - Final route: ${routes.map((r) => r.runtimeType.toString()).join(", ")}');
    return DeepLink(routes);
  }
}
