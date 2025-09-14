import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';

enum LessonActionType {
  locked,
  unlocked,
  completed,
}

class LessonActionButtonWidget extends StatelessWidget {
  const LessonActionButtonWidget({
    super.key,
    required this.actionType,
    this.onMarkCompleted,
    this.onPlay,
  });

  final LessonActionType actionType;
  final VoidCallback? onMarkCompleted;
  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) {
    switch (actionType) {
      case LessonActionType.locked:
        return _buildLockedIcon();
      case LessonActionType.unlocked:
        return _buildUnlockedActions();
      case LessonActionType.completed:
        return _buildCompletedIcon();
    }
  }

  Widget _buildLockedIcon() {
    return Assets.icons.lockCurved.svg();
  }

  Widget _buildUnlockedActions() {
    return GestureDetector(
      onTap: onPlay,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.current.primary500.withOpacity(0.1),
        ),
        child: Assets.icons.playBold.svg(
          colorFilter: ColorFilter.mode(
            AppColors.current.primary500,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedIcon() {
    return Assets.icons.checkboxChecked.svg(
      colorFilter: ColorFilter.mode(
        AppColors.current.primary500,
        BlendMode.srcIn,
      ),
    );
  }
}
