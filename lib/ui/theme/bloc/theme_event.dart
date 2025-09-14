import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';

sealed class ThemeEvent extends BaseEvent {
  const ThemeEvent();
}

final class ThemeToggleEvent extends ThemeEvent {
  const ThemeToggleEvent();
}

final class ThemeLoadEvent extends ThemeEvent {
  const ThemeLoadEvent();
}
