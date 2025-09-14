import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/shared_view/common_image_view.dart';
import 'package:e_learning_app/base/shared_view/foundation_state.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:gap/gap.dart';

import '../../base/shared_view/common_app_bar.dart';
import '../../base/shared_view/common_scaffold.dart';
import '../../domain/entity/enum/enum.dart';
import '../../domain/entity/course/user_course_entity.dart';
import 'bloc/my_course_bloc.dart';
import 'bloc/my_course_event.dart';
import 'bloc/my_course_state.dart';

@RoutePage()
class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends FoundationState<MyCoursePage, MyCourseBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(FetchUserCoursesEvent());
  }

  @override
  Widget buildPage(BuildContext context) {
    return DefaultTabController(
      length: MyCourseTab.values.length,
      child: BlocBuilder<MyCourseBloc, MyCourseState>(
        builder: (context, state) {
          return CommonScaffold(
            backgroundColor: AppColors.current.scaffoldColor,
            appBar: CommonAppBar(
              text: 'My Course',
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              leadingIcon: LeadingIcon.none,
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Assets.icons.searchLight.svg(
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        AppColors.current.greyscale900,
                        BlendMode.srcIn,
                      )),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Assets.icons.moreCircleLight.svg(
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        AppColors.current.greyscale900,
                        BlendMode.srcIn,
                      )),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.current.otherWhite,
                  padding: const EdgeInsets.all(24).copyWith(bottom: 0),
                  child: TabBar(
                    onTap: (index) {
                      bloc.add(MyCourseTabChangedEvent(
                          tab: MyCourseTab.values[index]));
                    },
                    tabs: MyCourseTab.values
                        .map<Widget>((e) => Tab(text: e.fromTitle()))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildCourseList(state.ongoingCourses),
                      _buildCourseList(state.completedCourses),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseList(List<UserCourseEntity> courses) {
    if (courses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 64,
              color: AppColors.current.greyscale400,
            ),
            const Gap(16),
            Text(
              'No hay cursos',
              style: AppTextStyles.h6Bold.copyWith(
                color: AppColors.current.greyscale400,
              ),
            ),
            const Gap(8),
            Text(
              'Inscríbete en algún curso para verlo aquí',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.current.greyscale400,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: courses.length,
      padding: const EdgeInsets.all(20),
      separatorBuilder: (context, index) => const Gap(20),
      itemBuilder: (context, index) => _item(courses[index]),
    );
  }

  Widget _item(UserCourseEntity userCourse) => GestureDetector(
        onTap: () {
          // Navegar a la página de detalles del curso
          AutoRouter.of(context)
              .push(CourseDetailRoute(id: userCourse.courseId));
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.current.otherWhite,
          ),
          child: Row(
            children: [
              CommonImageView(
                imageUrl: userCourse.course.image,
                width: 100,
                height: 100,
                radius: 20,
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userCourse.course.title, style: AppTextStyles.h6Bold),
                    const Gap(12),
                    Text(
                      '${userCourse.course.duration} mins',
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.current.greyscale700),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final progress =
                                  userCourse.progressPercentage / 100.0;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 8,
                                      width: constraints.maxWidth,
                                      decoration: BoxDecoration(
                                        color: AppColors.current.greyscale200,
                                      ),
                                    ),
                                    Container(
                                      height: 8,
                                      width: constraints.maxWidth * progress,
                                      decoration: BoxDecoration(
                                        gradient:
                                            AppColors.current.gradientOrange,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const Gap(8),
                        Text(
                          '${userCourse.progressPercentage}%',
                          style: AppTextStyles.bodySmallMedium
                              .copyWith(color: AppColors.current.greyscale700),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
