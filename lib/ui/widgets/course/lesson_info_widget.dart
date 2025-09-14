import 'package:flutter/material.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:gap/gap.dart';

class LessonInfoWidget extends StatelessWidget {
  const LessonInfoWidget({
    super.key,
    required this.lesson,
    required this.index,
    this.isCompleted = false,
    this.onMarkCompleted,
  });

  final LessonEntity lesson;
  final int index;
  final bool isCompleted;
  final VoidCallback? onMarkCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildLessonNumber(),
            const Gap(Dimens.paddingHorizontal),
            Expanded(
              child: _buildLessonDetails(),
            ),
          ],
        ),
        if (onMarkCompleted != null && !isCompleted) ...[
          const Gap(Dimens.paddingVertical),
          _buildMarkCompletedButton(),
        ],
      ],
    );
  }

  Widget _buildLessonNumber() {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.current.transparentBlue,
      ),
      child: Text(
        _getFormattedIndex(),
        style: AppTextStyles.h6Bold.withPrimaryColor(),
      ),
    );
  }

  Widget _buildLessonDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lesson.title,
          style: AppTextStyles.h6Bold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          '${lesson.duration} mins',
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }

  String _getFormattedIndex() {
    return (index + 1).toString().padLeft(2, '0');
  }

  Widget _buildMarkCompletedButton() {
    return GestureDetector(
      onTap: onMarkCompleted,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.current.primary500,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.current.otherWhite,
              size: 16,
            ),
            const Gap(8),
            Text(
              'Marcar como completado',
              style: AppTextStyles.bodySmallRegular.copyWith(
                color: AppColors.current.otherWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
