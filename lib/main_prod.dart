import 'package:flutter/foundation.dart';
import 'package:e_learning_app/config/environment.dart';
import 'package:e_learning_app/main.dart';

void main() {
  initApp(
    env: AppEnvironment.prod,
    enableLog: !kReleaseMode,
  );
}
