import 'package:e_learning_app/domain/entity/course/category_entity.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/course/enrollment_entity.dart';
import 'package:e_learning_app/domain/entity/course/user_course_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_progress_entity.dart';
import 'package:e_learning_app/domain/entity/course/promote_entity.dart';
import 'package:e_learning_app/domain/entity/course/review_entity.dart';
import 'package:e_learning_app/domain/entity/course/search_history_entity.dart';
import 'package:e_learning_app/domain/use_case/course/enroll_course_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/fetch_course_detail_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/toggle_favourite_course_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/watch_favorite_course_stream_use_case.dart';

import '../../base/helper/result.dart';
import '../entity/course/mentor_entity.dart';

abstract class CourseRepo {
  Future<Result<List<PromoteEntity>>> fetchPromotes();

  Future<Result<List<CourseEntity>>> fetchMostPopularCourse();

  Future<Result<List<MentorEntity>>> fetchTopMentors();

  Future<Result<List<CategoryEntity>>> fetchCategories();

  Future<Result<List<LessonEntity>>> fetchLessonListFromCourseId(String id);

  Future<Result<List<ReviewEntity>>> fetchReviewListFromCourseId(String id);

  Future<Result<CourseEntity>> fetchCourseDetail(CourseDetailRequest req);

  Stream<WatchFavoriteCourseStreamOutput> watchFavoriteCourseStream();

  Future<Result<ToggleFavouriteCourseOutput>> toggleFavouriteCourse(
      ToggleFavouriteCourseInput input);

  Future<Result<List<String>>> fetchSearchSuggestions();

  Future<Result<List<SearchHistoryEntity>>> fetchSearchHistories();

  Future<Result<EnrollmentEntity>> enrollCourse(EnrollCourseRequest request);

  Future<Result<List<EnrollmentEntity>>> fetchUserEnrollments();

  Future<Result<List<UserCourseEntity>>> fetchUserCoursesWithDetails();

  Future<Result<bool>> isUserEnrolled(String courseId);

  Future<Result<LessonProgressEntity?>> markLessonAsCompleted(
      String lessonId, String courseId);

  Future<Result<List<LessonProgressEntity>>> fetchLessonProgress(
      String courseId);

  Future<Result<Map<String, dynamic>>> getCourseProgress(String courseId);
}
