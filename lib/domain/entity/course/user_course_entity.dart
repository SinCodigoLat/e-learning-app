import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/course/enrollment_entity.dart';

class UserCourseEntity {
  final String id;
  final String userId;
  final String courseId;
  final DateTime enrolledAt;
  final String status;
  final int progressPercentage;
  final DateTime lastAccessedAt;
  final DateTime? completedAt;
  final CourseEntity course;

  UserCourseEntity({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.enrolledAt,
    required this.status,
    required this.progressPercentage,
    required this.lastAccessedAt,
    this.completedAt,
    required this.course,
  });

  static UserCourseEntity fromEnrollmentAndCourse(EnrollmentEntity enrollment, CourseEntity course) {
    return UserCourseEntity(
      id: enrollment.id,
      userId: enrollment.userId,
      courseId: enrollment.courseId,
      enrolledAt: enrollment.enrolledAt,
      status: enrollment.status,
      progressPercentage: enrollment.progressPercentage,
      lastAccessedAt: enrollment.lastAccessedAt,
      completedAt: enrollment.completedAt,
      course: course,
    );
  }

  bool get isCompleted => status == 'completed' || progressPercentage >= 100;
  bool get isOngoing => status == 'active' && progressPercentage < 100;
}
