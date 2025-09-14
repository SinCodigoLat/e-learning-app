import 'package:flutter/material.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:gap/gap.dart';

import '../../../base/constants/ui/app_colors.dart';
import '../../../base/constants/ui/dimens.dart';
import 'lesson_action_button_widget.dart';
import 'lesson_info_widget.dart';

class LessonItemWidget extends StatelessWidget {
  const LessonItemWidget({
    super.key,
    required this.item,
    required this.index,
    this.onTap,
    this.isUnlocked,
    this.isCompleted = false,
    this.onMarkCompleted,
  });

  final LessonEntity item;
  final int index;
  final VoidCallback? onTap;
  final bool? isUnlocked;
  final bool isCompleted;
  final VoidCallback? onMarkCompleted;

  @override
  Widget build(BuildContext context) {
    final unlocked = isUnlocked ?? item.isFree;
    final actionType = _getActionType(unlocked);

    return GestureDetector(
      onTap: () {
        if (!unlocked) return;
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.paddingVertical,
          horizontal: 20,
        ),
        decoration: _buildDecoration(),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: LessonInfoWidget(
                  lesson: item,
                  index: index,
                  isCompleted: isCompleted,
                  onMarkCompleted: onMarkCompleted,
                ),
              ),
              const Gap(Dimens.paddingHorizontal),
              LessonActionButtonWidget(
                actionType: actionType,
                onPlay: unlocked ? onTap : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.current.otherWhite,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 16,
          color: const Color(0xff04060F).withOpacity(.05),
        ),
      ],
    );
  }

  LessonActionType _getActionType(bool unlocked) {
    if (isCompleted) {
      return LessonActionType.completed;
    } else if (unlocked) {
      return LessonActionType.unlocked;
    } else {
      return LessonActionType.locked;
    }
  }
}
