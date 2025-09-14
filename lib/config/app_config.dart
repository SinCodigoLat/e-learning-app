import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/helper/module_initializer.dart';
import 'package:e_learning_app/di/di.dart';

import '../base/bloc/app_bloc_observer.dart';

class AppConfig extends ModuleInitializer {
  factory AppConfig.instance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<void> config() async {
    Bloc.observer = AppBlocObserver();
    return configureDependencies();
  }
}
