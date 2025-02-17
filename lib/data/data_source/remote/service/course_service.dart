import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/course/category_response_dto.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/course/course_response_dto.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/course/lesson_response_dto.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/api_response.dart';
import '../dto/course/promote_response_dto.dart';

part 'course_service.g.dart';

@RestApi()
@lazySingleton
abstract class CourseService {
  @factoryMethod
  factory CourseService(Dio dio) = _CourseService;

  @GET('/promote')
  Future<ApiResponse<List<PromoteResponseDto>>> fetchPromotes();

  @GET('/categories')
  Future<ApiResponse<List<CategoryResponseDto>>> fetchCategories();

  @GET('/api/course/{id}')
  Future<ApiResponse<CourseResponseDto>> fetchCourseFromId(@Path('id') String id);

  @GET('/courses/popular')
  Future<ApiResponse<List<CourseResponseDto>>> fetchMostPopularCourse();

  @GET('/mentors')
  Future<ApiResponse<List<MentorResponseDto>>> fetchMentors();

  @GET('/courses/{courseId}/lessons')
  Future<ApiResponse<List<LessonResponseDto>>> fetchLessonListFromCourseId(@Path('courseId') String id);
}
