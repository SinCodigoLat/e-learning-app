import 'dart:async';

import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/repo/base_repo.dart';
import 'package:e_learning_app/data/data_source/remote/service/supabase_course_service.dart';
import 'package:e_learning_app/data/mapper/course/category_mapper.dart';
import 'package:e_learning_app/data/mapper/course/course_mapper.dart';
import 'package:e_learning_app/data/mapper/course/enrollment_mapper.dart';
import 'package:e_learning_app/data/mapper/course/lesson_progress_mapper.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/enrollment_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/course_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/lesson_progress_response_dto.dart';
import 'package:e_learning_app/data/mapper/course/lesson_mapper.dart';
import 'package:e_learning_app/data/mapper/course/mentor_mapper.dart';
import 'package:e_learning_app/data/mapper/course/promote_mapper.dart';
import 'package:e_learning_app/data/mapper/course/review_mapper.dart';
import 'package:e_learning_app/data/mapper/course/search_history_mapper.dart';
import 'package:e_learning_app/domain/entity/course/category_entity.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/course/enrollment_entity.dart';
import 'package:e_learning_app/domain/entity/course/user_course_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/domain/entity/course/lesson_progress_entity.dart';
import 'package:e_learning_app/domain/entity/course/mentor_entity.dart';
import 'package:e_learning_app/domain/entity/course/promote_entity.dart';
import 'package:e_learning_app/domain/entity/course/review_entity.dart';
import 'package:e_learning_app/domain/entity/course/search_history_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:e_learning_app/domain/use_case/course/enroll_course_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/fetch_course_detail_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/toggle_favourite_course_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/watch_favorite_course_stream_use_case.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CourseRepo)
class CourseRepoImpl extends BaseRepository implements CourseRepo {
  final SupabaseCourseService _courseService;

  CourseRepoImpl(this._courseService);

  final StreamController<WatchFavoriteCourseStreamOutput>
      _favouriteCourseStreamController = StreamController.broadcast();

  @override
  Future<Result<List<PromoteEntity>>> fetchPromotes() {
    return handleApiCall(
      _courseService.fetchPromotes(),
      mapper: (resp) =>
          resp?.data?.map(PromoteMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<List<CourseEntity>>> fetchMostPopularCourse() {
    return handleApiCall(
      _courseService.fetchMostPopularCourse(),
      mapper: (resp) =>
          resp?.data?.map(CourseMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<List<MentorEntity>>> fetchTopMentors() {
    return handleApiCall(
      _courseService.fetchMentors(),
      mapper: (resp) =>
          resp?.data?.map(MentorMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<List<CategoryEntity>>> fetchCategories() {
    return handleApiCall(
      _courseService.fetchCategories(),
      mapper: (resp) =>
          resp?.data?.map(CategoryMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<CourseEntity>> fetchCourseDetail(CourseDetailRequest req) {
    return handleApiCall(
      _courseService.fetchCourseFromId(req.id),
      mapper: (resp) => CourseMapper.mapToEntity(resp?.data),
    );
  }

  @override
  Future<Result<List<LessonEntity>>> fetchLessonListFromCourseId(String id) {
    return handleApiCall(
      _courseService.fetchLessonListFromCourseId(id),
      mapper: (resp) =>
          resp?.data?.map(LessonMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<List<ReviewEntity>>> fetchReviewListFromCourseId(String id) {
    return handleApiCall(
      _courseService.fetchReviewListFromCourseId(id),
      mapper: (resp) =>
          resp?.data?.map(ReviewMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Stream<WatchFavoriteCourseStreamOutput> watchFavoriteCourseStream() {
    return _favouriteCourseStreamController.stream;
  }

  @override
  Future<Result<ToggleFavouriteCourseOutput>> toggleFavouriteCourse(
      ToggleFavouriteCourseInput input) async {
    _favouriteCourseStreamController.add(
        WatchFavoriteCourseStreamOutput(id: input.id, isFav: !input.isFav));
    return Result.ok(ToggleFavouriteCourseOutput());
  }

  @override
  Future<Result<List<SearchHistoryEntity>>> fetchSearchHistories() {
    return handleApiCall(
      _courseService.fetchSearchHistory(),
      mapper: (resp) =>
          resp?.data
              ?.map<SearchHistoryEntity>(SearchHistoryMapper.mapToEntity)
              .toList() ??
          [],
    );
  }

  @override
  Future<Result<List<String>>> fetchSearchSuggestions() {
    return handleApiCall(_courseService.fetchSearchSuggestion(),
        mapper: (resp) => resp?.data ?? []);
  }

  @override
  Future<Result<EnrollmentEntity>> enrollCourse(EnrollCourseRequest request) {
    return handleApiCall(
      _courseService.enrollCourse(request.courseId),
      mapper: (resp) => EnrollmentMapper.mapToEntity(resp?.data),
    );
  }

  @override
  Future<Result<List<EnrollmentEntity>>> fetchUserEnrollments() {
    return handleApiCall(
      _courseService.fetchUserEnrollments(),
      mapper: (resp) =>
          resp?.data?.map(EnrollmentMapper.mapToEntity).toList() ?? [],
    );
  }

  @override
  Future<Result<List<UserCourseEntity>>> fetchUserCoursesWithDetails() {
    return handleApiCall(
      _courseService.fetchUserCoursesWithDetails(),
      mapper: (resp) {
        if (resp?.data == null) return [];

        return resp!.data!.map((item) {
          final enrollment = EnrollmentMapper.mapToEntity(
              EnrollmentResponseDto.fromJson(item));
          final course = CourseMapper.mapToEntity(
              CourseResponseDto.fromJson(item['courses']));
          return UserCourseEntity.fromEnrollmentAndCourse(enrollment, course);
        }).toList();
      },
    );
  }

  @override
  Future<Result<bool>> isUserEnrolled(String courseId) {
    return handleApiCall(
      _courseService.isUserEnrolled(courseId),
      mapper: (resp) => resp?.data ?? false,
    );
  }

  @override
  Future<Result<LessonProgressEntity?>> markLessonAsCompleted(
      String lessonId, String courseId) {
    return handleApiCall(
      _courseService.markLessonAsCompleted(lessonId, courseId),
      mapper: (resp) => resp?.data != null
          ? LessonProgressMapper.mapToEntity(resp!.data!)
          : null,
    );
  }

  @override
  Future<Result<List<LessonProgressEntity>>> fetchLessonProgress(
      String courseId) {
    return handleApiCall(
      _courseService.fetchLessonProgress(courseId),
      mapper: (resp) {
        if (resp?.data == null) return [];
        return resp!.data!
            .map((progress) => LessonProgressMapper.mapToEntity(progress))
            .toList();
      },
    );
  }

  @override
  Future<Result<Map<String, dynamic>>> getCourseProgress(String courseId) {
    return handleApiCall(
      _courseService.getCourseProgress(courseId),
      mapper: (resp) => resp?.data ?? {},
    );
  }
}
