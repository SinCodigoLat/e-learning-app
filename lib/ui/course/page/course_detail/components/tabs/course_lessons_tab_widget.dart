import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:e_learning_app/ui/widgets/course/lesson_item_widget.dart';
import 'package:e_learning_app/ui/widgets/course/lessons_header_widget.dart';
import 'package:gap/gap.dart';

import '../../../../../../base/constants/ui/dimens.dart';

class CourseLessonsTabWidget extends StatelessWidget {
  const CourseLessonsTabWidget({
    super.key,
    required this.lessons,
    required this.course,
    required this.isEnrolled,
    this.lessonProgress = const {},
    this.onMarkLessonCompleted,
  });

  final List<LessonEntity> lessons;
  final CourseEntity course;
  final bool isEnrolled;
  final Map<String, bool> lessonProgress;
  final Function(String lessonId)? onMarkLessonCompleted;

  @override
  Widget build(BuildContext context) {
    final completedLessons =
        lessonProgress.values.where((completed) => completed).length;

    return Container(
      color: AppColors.current.scaffoldColor,
      child: ListView.separated(
        itemCount: lessons.length + 1, // +1 for header
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingHorizontalLarge,
        ).copyWith(top: Dimens.paddingVerticalLarge),
        separatorBuilder: (_, index) {
          if (index == 0) {
            return const Gap(Dimens.paddingVerticalLarge);
          }
          return const Gap(Dimens.paddingVerticalLarge);
        },
        itemBuilder: (_, int index) {
          if (index == 0) {
            return LessonsHeaderWidget(
              totalLessons: lessons.length,
              completedLessons: completedLessons,
              courseTitle: course.title,
            );
          }

          final lessonIndex = index - 1;
          final item = lessons[lessonIndex];
          final isCompleted = lessonProgress[item.id] ?? false;

          return LessonItemWidget(
            onTap: () {
              AutoRouter.of(context).push(LessonVideoPlayerRoute(
                videoUrl:
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                title: item.title,
              ));
            },
            item: item,
            index: lessonIndex,
            isUnlocked: isEnrolled || item.isFree,
            isCompleted: isCompleted,
            onMarkCompleted: () {
              onMarkLessonCompleted?.call(item.id);
            },
          );
        },
      ),
    );
  }
}
