import 'package:equatable/equatable.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';

class ThemeState extends Equatable {
  final AppThemeType themeType;

  const ThemeState({
    this.themeType = AppThemeType.light,
  });

  ThemeState copyWith({
    AppThemeType? themeType,
  }) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
    );
  }

  @override
  List<Object?> get props => [themeType];
}
