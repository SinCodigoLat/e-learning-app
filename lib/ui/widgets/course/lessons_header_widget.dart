import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:gap/gap.dart';

class LessonsHeaderWidget extends StatelessWidget {
  const LessonsHeaderWidget({
    super.key,
    required this.totalLessons,
    required this.completedLessons,
    this.courseTitle,
  });

  final int totalLessons;
  final int completedLessons;
  final String? courseTitle;

  @override
  Widget build(BuildContext context) {
    final progressPercentage =
        totalLessons > 0 ? (completedLessons / totalLessons * 100).round() : 0;

    return Container(
      padding: const EdgeInsets.all(Dimens.paddingHorizontalLarge),
      decoration: BoxDecoration(
        color: AppColors.current.otherWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 8,
            color: const Color(0xff04060F).withOpacity(.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (courseTitle != null) ...[
            Text(
              'Lecciones de $courseTitle',
              style: AppTextStyles.h5Bold,
            ),
            const Gap(Dimens.paddingVertical),
          ],
          Row(
            children: [
              Expanded(
                child: _buildProgressInfo(progressPercentage),
              ),
              _buildProgressCircle(progressPercentage),
            ],
          ),
          const Gap(Dimens.paddingVertical),
          _buildProgressBar(progressPercentage),
        ],
      ),
    );
  }

  Widget _buildProgressInfo(int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progreso del curso',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.current.greyscale600,
          ),
        ),
        const Gap(4),
        Text(
          '$completedLessons de $totalLessons lecciones completadas',
          style: AppTextStyles.bodySmallRegular.copyWith(
            color: AppColors.current.greyscale500,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCircle(int percentage) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 6,
            backgroundColor: AppColors.current.greyscale300,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.current.primary500,
            ),
          ),
          Text(
            '$percentage%',
            style: AppTextStyles.h6Bold.copyWith(
              color: AppColors.current.primary500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progreso',
              style: AppTextStyles.bodySmallRegular.copyWith(
                color: AppColors.current.greyscale600,
              ),
            ),
            Text(
              '$percentage%',
              style: AppTextStyles.bodySmallBold.copyWith(
                color: AppColors.current.primary500,
              ),
            ),
          ],
        ),
        const Gap(8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: AppColors.current.greyscale300,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.current.primary500,
            ),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
