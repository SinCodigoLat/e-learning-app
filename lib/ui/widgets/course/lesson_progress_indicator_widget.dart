import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';

class LessonProgressIndicatorWidget extends StatelessWidget {
  const LessonProgressIndicatorWidget({
    super.key,
    required this.isCompleted,
    this.progress = 0.0,
  });

  final bool isCompleted;
  final double progress; // 0.0 to 1.0

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return _buildCompletedIndicator();
    }

    if (progress > 0.0) {
      return _buildProgressIndicator();
    }

    return _buildEmptyIndicator();
  }

  Widget _buildCompletedIndicator() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.current.primary500,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 12,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        value: progress,
        strokeWidth: 2,
        backgroundColor: AppColors.current.greyscale300,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.current.primary500,
        ),
      ),
    );
  }

  Widget _buildEmptyIndicator() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.current.greyscale300,
      ),
    );
  }
}
