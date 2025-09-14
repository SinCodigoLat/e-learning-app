import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:gap/gap.dart';

class EnrollmentSuccessDialog extends StatelessWidget {
  const EnrollmentSuccessDialog({
    super.key,
    required this.courseTitle,
    required this.coursePrice,
  });

  final String courseTitle;
  final String coursePrice;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.current.otherWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono de éxito
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.current.primary500.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                size: 48,
                color: AppColors.current.primary500,
              ),
            ),
            const Gap(24),

            // Título
            Text(
              '¡Felicitaciones!',
              style: AppTextStyles.h4Bold.copyWith(
                color: AppColors.current.greyscale900,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),

            // Mensaje
            Text(
              'Te has inscrito exitosamente en el curso',
              style: AppTextStyles.bodyLargeRegular.copyWith(
                color: AppColors.current.greyscale700,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8),

            // Nombre del curso
            Text(
              courseTitle,
              style: AppTextStyles.h6Bold.copyWith(
                color: AppColors.current.primary500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),

            // Precio
            Text(
              'Por solo $coursePrice',
              style: AppTextStyles.bodyLargeSemiBold.copyWith(
                color: AppColors.current.greyscale600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(24),

            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.current.primary500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Cerrar',
                      style: AppTextStyles.bodyLargeSemiBold.copyWith(
                        color: AppColors.current.primary500,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navegar a "My Courses"
                      AutoRouter.of(context).push(const MyCourseRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Ver Mis Cursos',
                      style: AppTextStyles.bodyLargeSemiBold.copyWith(
                        color: AppColors.current.otherWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
