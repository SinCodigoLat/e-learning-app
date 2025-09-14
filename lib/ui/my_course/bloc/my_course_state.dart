import 'package:e_learning_app/base/bloc/base_bloc/base_state.dart';
import 'package:e_learning_app/domain/entity/course/user_course_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';

final class MyCourseState extends BaseState {
  final List<UserCourseEntity> userCourses;
  final List<UserCourseEntity> ongoingCourses;
  final List<UserCourseEntity> completedCourses;
  final MyCourseTab selectedTab;

  MyCourseState({
    this.userCourses = const [],
    this.ongoingCourses = const [],
    this.completedCourses = const [],
    this.selectedTab = MyCourseTab.onGoing,
  }) : super();

  MyCourseState copyWith({
    List<UserCourseEntity>? userCourses,
    List<UserCourseEntity>? ongoingCourses,
    List<UserCourseEntity>? completedCourses,
    MyCourseTab? selectedTab,
  }) {
    return MyCourseState(
      userCourses: userCourses ?? this.userCourses,
      ongoingCourses: ongoingCourses ?? this.ongoingCourses,
      completedCourses: completedCourses ?? this.completedCourses,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [
        userCourses,
        ongoingCourses,
        completedCourses,
        selectedTab,
      ];
}
