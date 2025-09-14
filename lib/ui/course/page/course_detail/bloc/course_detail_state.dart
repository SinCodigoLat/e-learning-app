import 'package:e_learning_app/base/bloc/base_bloc/base_state.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/domain/entity/course/review_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';

final class CourseDetailState extends BaseState {
  final CourseEntity course;
  final List<LessonEntity> lessons;
  final List<ReviewEntity> reviews;
  final CourseTab tab;
  final bool enrollmentSuccess;
  final bool isEnrolled;

  CourseDetailState({
    required this.course,
    this.lessons = const [],
    this.reviews = const [],
    required this.tab,
    this.enrollmentSuccess = false,
    this.isEnrolled = false,
  });

  CourseDetailState copyWith({
    CourseEntity? course,
    List<LessonEntity>? lessons,
    List<ReviewEntity>? reviews,
    CourseTab? tab,
    bool? enrollmentSuccess,
    bool? isEnrolled,
  }) {
    return CourseDetailState(
      course: course ?? this.course,
      lessons: lessons ?? this.lessons,
      reviews: reviews ?? this.reviews,
      tab: tab ?? this.tab,
      enrollmentSuccess: enrollmentSuccess ?? this.enrollmentSuccess,
      isEnrolled: isEnrolled ?? this.isEnrolled,
    );
  }

  @override
  List<Object?> get props => [
        course,
        lessons,
        reviews,
        tab,
        enrollmentSuccess,
        isEnrolled,
      ];
}
