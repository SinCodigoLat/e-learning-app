import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/ui/theme/bloc/theme_event.dart';
import 'package:e_learning_app/ui/theme/bloc/theme_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeToggleEvent>(_onThemeToggleEvent);
    on<ThemeLoadEvent>(_onThemeLoadEvent);
  }

  Future<void> _onThemeToggleEvent(
      ThemeToggleEvent event, Emitter<ThemeState> emit) async {
    print('🎨 ThemeToggleEvent received - current theme: ${state.themeType}');
    final newThemeType = state.themeType == AppThemeType.light
        ? AppThemeType.dark
        : AppThemeType.light;

    print('🎨 Switching to theme: $newThemeType');
    emit(state.copyWith(themeType: newThemeType));
    print('🎨 Theme state updated to: ${state.themeType}');
  }

  Future<void> _onThemeLoadEvent(
      ThemeLoadEvent event, Emitter<ThemeState> emit) async {
    // Load initial theme - default to light for now
    emit(state.copyWith(themeType: AppThemeType.light));
  }
}
