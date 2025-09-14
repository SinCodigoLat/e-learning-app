import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/ui/theme/bloc/theme_bloc.dart';
import 'package:e_learning_app/ui/theme/bloc/theme_event.dart';
import 'package:e_learning_app/ui/theme/bloc/theme_state.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThemeBloc>();
    print('🎨 ThemeToggleWidget: Using bloc instance: ${bloc.hashCode}');
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: bloc,
      builder: (context, state) {
        print('🎨 ThemeToggleWidget: Building with state: ${state.themeType}');
        print(
            '🎨 ThemeToggleWidget: Switch value should be: ${state.themeType == AppThemeType.dark}');
        final colors = AppColors.of(context);
        print(
            '🎨 ThemeToggleWidget: AppColors.current.scaffoldColor: ${AppColors.current.scaffoldColor}');

        return Switch(
          value: state.themeType == AppThemeType.dark,
          onChanged: (value) {
            print(
                '🎨 Switch toggled - current state: ${state.themeType}, new value: $value');
            context.read<ThemeBloc>().add(const ThemeToggleEvent());
          },
          activeColor: colors.primary500,
          activeTrackColor: colors.primary100,
          inactiveThumbColor: colors.greyscale300,
          inactiveTrackColor: colors.greyscale200,
        );
      },
    );
  }
}

class ThemeToggleIconButton extends StatelessWidget {
  const ThemeToggleIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colors = AppColors.of(context);

        return IconButton(
          onPressed: () {
            context.read<ThemeBloc>().add(const ThemeToggleEvent());
          },
          icon: Icon(
            state.themeType == AppThemeType.dark
                ? Icons.light_mode
                : Icons.dark_mode,
            color: colors.greyscale900,
          ),
        );
      },
    );
  }
}
