import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/category_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/course_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/enrollment_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/lesson_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/lesson_progress_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/review_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/promote_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/search_history_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/api_response.dart';
import 'package:e_learning_app/data/data_source/remote/service/supabase_mentor_service.dart';

@lazySingleton
class SupabaseCourseService {
  final SupabaseClient _client;

  SupabaseCourseService(this._client);

  // Mock data for development - replace with real Supabase queries later
  Future<ApiResponse<List<PromoteResponseDto>>> fetchPromotes() async {
    // Mock data - replace with real Supabase query
    final mockData = [
      PromoteResponseDto(
        id: '1',
        title: 'Special Offer',
        description: 'Get 50% off on all courses',
        discount: '50',
        isActive: true,
        expiryDate: '2024-12-31',
      ),
    ];

    return ApiResponse<List<PromoteResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<CategoryResponseDto>>> fetchCategories() async {
    try {
      print('🔍 SupabaseCourseService - fetchCategories called');

      // Obtener categorías únicas de los cursos más populares
      final response = await _client
          .from('courses')
          .select('category')
          .order('rating', ascending: false)
          .order('students_count', ascending: false);

      print('🔍 SupabaseCourseService - Raw categories response: $response');

      // Obtener categorías únicas
      final categories = (response as List)
          .map((item) => item['category'] as String)
          .toSet()
          .toList()
          .asMap()
          .entries
          .map((entry) => CategoryResponseDto(
                id: entry.key.toString(),
                name: entry.value,
              ))
          .toList();

      print(
          '🔍 SupabaseCourseService - Mapped categories: ${categories.length}');

      return ApiResponse<List<CategoryResponseDto>>(
        statusCode: 200,
        data: categories,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error: $e');
      return ApiResponse<List<CategoryResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching categories: $e'],
      );
    }
  }

  Future<ApiResponse<List<CourseResponseDto>>> fetchMostPopularCourse() async {
    try {
      print('🔍 SupabaseCourseService - fetchMostPopularCourse called');

      // Obtener los 5 cursos más populares usando la vista
      final response =
          await _client.from('popular_courses').select('*').limit(5);

      print('🔍 SupabaseCourseService - Raw Supabase response: $response');

      final courses = (response as List).map((course) {
        print('🔍 Raw course data: $course');
        final dto = CourseResponseDto.fromJson(course);
        print(
            '🔍 Mapped course DTO - imageUrl: ${dto.imageUrl}, image: ${dto.image}');
        return dto;
      }).toList();

      print('🔍 SupabaseCourseService - Mapped courses: ${courses.length}');

      return ApiResponse<List<CourseResponseDto>>(
        statusCode: 200,
        data: courses,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error: $e');
      return ApiResponse<List<CourseResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching popular courses: $e'],
      );
    }
  }

  Future<ApiResponse<List<MentorResponseDto>>> fetchMentors() async {
    // Use the dedicated mentor service
    final mentorService = SupabaseMentorService(_client);
    return await mentorService.fetchTopMentors();
  }

  Future<ApiResponse<CourseResponseDto>> fetchCourseFromId(String id) async {
    try {
      print('🔍 SupabaseCourseService - fetchCourseFromId called with id: $id');

      // Obtener curso por ID desde la base de datos
      final response =
          await _client.from('courses').select('*').eq('id', id).single();

      print('🔍 SupabaseCourseService - Raw course response: $response');

      final course = CourseResponseDto.fromJson(response);

      return ApiResponse<CourseResponseDto>(
        statusCode: 200,
        data: course,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error fetching course: $e');
      return ApiResponse<CourseResponseDto>(
        statusCode: 500,
        data: CourseResponseDto(),
        message: ['Error fetching course: $e'],
      );
    }
  }

  Future<ApiResponse<List<LessonResponseDto>>> fetchLessonListFromCourseId(
      String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - fetchLessonListFromCourseId called with courseId: $courseId');

      // Obtener lecciones del curso desde la base de datos
      final response = await _client
          .from('lessons')
          .select('*')
          .eq('course_id', courseId)
          .order('title');

      print('🔍 SupabaseCourseService - Raw lessons response: $response');

      final lessons = (response as List)
          .map((lesson) => LessonResponseDto.fromJson(lesson))
          .toList();

      print('🔍 SupabaseCourseService - Mapped lessons: ${lessons.length}');

      return ApiResponse<List<LessonResponseDto>>(
        statusCode: 200,
        data: lessons,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error fetching lessons: $e');
      return ApiResponse<List<LessonResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching lessons: $e'],
      );
    }
  }

  Future<ApiResponse<List<ReviewResponseDto>>> fetchReviewListFromCourseId(
      String courseId) async {
    // Mock data - replace with real Supabase query
    final mockData = [
      ReviewResponseDto(
        id: '1',
        courseId: courseId,
        userId: 'user1',
        rating: 5.0,
        comment: 'Great course!',
        createdAt: '2024-01-15T10:30:00Z',
      ),
    ];

    return ApiResponse<List<ReviewResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<String>>> fetchSearchSuggestion() async {
    // Mock data - replace with real Supabase query
    final mockData = ['Flutter', 'Dart', 'Mobile Development', 'UI/UX'];

    return ApiResponse<List<String>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<SearchHistoryResponseDto>>>
      fetchSearchHistory() async {
    // Mock data - replace with real Supabase query
    final mockData = [
      SearchHistoryResponseDto(
        id: '1',
        keyword: 'Flutter',
        searchedAt: DateTime.now(),
      ),
    ];

    return ApiResponse<List<SearchHistoryResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<EnrollmentResponseDto>> enrollCourse(
      String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - enrollCourse called with courseId: $courseId');

      // Obtener el usuario actual
      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<EnrollmentResponseDto>(
          statusCode: 401,
          data: EnrollmentResponseDto(),
          message: ['User not authenticated'],
        );
      }

      // Verificar si ya está inscrito
      final existingEnrollment = await _client
          .from('enrollments')
          .select('id')
          .eq('user_id', user.id)
          .eq('course_id', courseId)
          .maybeSingle();

      if (existingEnrollment != null) {
        return ApiResponse<EnrollmentResponseDto>(
          statusCode: 409,
          data: EnrollmentResponseDto(),
          message: ['User already enrolled in this course'],
        );
      }

      // Crear nuevo enrollment
      final response = await _client
          .from('enrollments')
          .insert({
            'user_id': user.id,
            'course_id': courseId,
            'status': 'active',
            'progress_percentage': 0,
          })
          .select()
          .single();

      print('🔍 SupabaseCourseService - Enrollment created: $response');

      final enrollment = EnrollmentResponseDto.fromJson(response);

      return ApiResponse<EnrollmentResponseDto>(
        statusCode: 201,
        data: enrollment,
        message: ['Successfully enrolled in course'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error enrolling in course: $e');
      return ApiResponse<EnrollmentResponseDto>(
        statusCode: 500,
        data: EnrollmentResponseDto(),
        message: ['Error enrolling in course: $e'],
      );
    }
  }

  Future<ApiResponse<List<EnrollmentResponseDto>>>
      fetchUserEnrollments() async {
    try {
      print('🔍 SupabaseCourseService - fetchUserEnrollments called');

      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<List<EnrollmentResponseDto>>(
          statusCode: 401,
          data: [],
          message: ['User not authenticated'],
        );
      }

      final response = await _client
          .from('enrollments')
          .select('*')
          .eq('user_id', user.id)
          .order('enrolled_at', ascending: false);

      print('🔍 SupabaseCourseService - User enrollments: $response');

      final enrollments = (response as List)
          .map((enrollment) => EnrollmentResponseDto.fromJson(enrollment))
          .toList();

      return ApiResponse<List<EnrollmentResponseDto>>(
        statusCode: 200,
        data: enrollments,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error fetching user enrollments: $e');
      return ApiResponse<List<EnrollmentResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching user enrollments: $e'],
      );
    }
  }

  Future<ApiResponse<List<Map<String, dynamic>>>>
      fetchUserCoursesWithDetails() async {
    try {
      print('🔍 SupabaseCourseService - fetchUserCoursesWithDetails called');

      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<List<Map<String, dynamic>>>(
          statusCode: 401,
          data: [],
          message: ['User not authenticated'],
        );
      }

      // Obtener enrollments con información del curso
      final response = await _client.from('enrollments').select('''
            *,
            courses (
              id,
              title,
              description,
              image_url,
              duration_hours,
              rating,
              category,
              price,
              original_price,
              students_count,
              reviews_count,
              level,
              language
            )
          ''').eq('user_id', user.id).order('enrolled_at', ascending: false);

      print('🔍 SupabaseCourseService - User courses with details: $response');

      return ApiResponse<List<Map<String, dynamic>>>(
        statusCode: 200,
        data: response as List<Map<String, dynamic>>,
        message: ['Success'],
      );
    } catch (e) {
      print(
          '🔍 SupabaseCourseService - Error fetching user courses with details: $e');
      return ApiResponse<List<Map<String, dynamic>>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching user courses with details: $e'],
      );
    }
  }

  Future<ApiResponse<bool>> isUserEnrolled(String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - isUserEnrolled called with courseId: $courseId');

      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<bool>(
          statusCode: 401,
          data: false,
          message: ['User not authenticated'],
        );
      }

      final response = await _client
          .from('enrollments')
          .select('id')
          .eq('user_id', user.id)
          .eq('course_id', courseId)
          .maybeSingle();

      final isEnrolled = response != null;

      print('🔍 SupabaseCourseService - Is user enrolled: $isEnrolled');

      return ApiResponse<bool>(
        statusCode: 200,
        data: isEnrolled,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error checking enrollment: $e');
      return ApiResponse<bool>(
        statusCode: 500,
        data: false,
        message: ['Error checking enrollment: $e'],
      );
    }
  }

  // Métodos para manejar el progreso de lecciones
  Future<ApiResponse<LessonProgressResponseDto>> markLessonAsCompleted(
      String lessonId, String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - markLessonAsCompleted called with lessonId: $lessonId, courseId: $courseId');
      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<LessonProgressResponseDto>(
          statusCode: 401,
          data: null,
          message: ['User not authenticated'],
        );
      }

      // Verificar si ya existe un registro de progreso
      final existingProgress = await _client
          .from('lesson_progress')
          .select('*')
          .eq('user_id', user.id)
          .eq('lesson_id', lessonId)
          .maybeSingle();

      LessonProgressResponseDto progressDto;

      if (existingProgress != null) {
        // Actualizar registro existente
        final updatedProgress = await _client
            .from('lesson_progress')
            .update({
              'is_completed': true,
              'completed_at': DateTime.now().toIso8601String(),
              'updated_at': DateTime.now().toIso8601String(),
            })
            .eq('id', existingProgress['id'])
            .select()
            .single();

        progressDto = LessonProgressResponseDto.fromJson(updatedProgress);
      } else {
        // Crear nuevo registro
        final newProgress = await _client
            .from('lesson_progress')
            .insert({
              'user_id': user.id,
              'lesson_id': lessonId,
              'course_id': courseId,
              'is_completed': true,
              'completed_at': DateTime.now().toIso8601String(),
            })
            .select()
            .single();

        progressDto = LessonProgressResponseDto.fromJson(newProgress);
      }

      print(
          '🔍 SupabaseCourseService - Lesson marked as completed successfully');
      return ApiResponse<LessonProgressResponseDto>(
        statusCode: 200,
        data: progressDto,
        message: ['Lesson marked as completed successfully'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error marking lesson as completed: $e');
      return ApiResponse<LessonProgressResponseDto>(
        statusCode: 500,
        data: null,
        message: ['Error marking lesson as completed: $e'],
      );
    }
  }

  Future<ApiResponse<List<LessonProgressResponseDto>>> fetchLessonProgress(
      String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - fetchLessonProgress called with courseId: $courseId');
      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<List<LessonProgressResponseDto>>(
          statusCode: 401,
          data: [],
          message: ['User not authenticated'],
        );
      }

      final response = await _client
          .from('lesson_progress')
          .select('*')
          .eq('user_id', user.id)
          .eq('course_id', courseId);

      final progressList = (response as List)
          .map((progress) => LessonProgressResponseDto.fromJson(progress))
          .toList();

      print(
          '🔍 SupabaseCourseService - Lesson progress fetched: ${progressList.length} records');
      return ApiResponse<List<LessonProgressResponseDto>>(
        statusCode: 200,
        data: progressList,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error fetching lesson progress: $e');
      return ApiResponse<List<LessonProgressResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching lesson progress: $e'],
      );
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> getCourseProgress(
      String courseId) async {
    try {
      print(
          '🔍 SupabaseCourseService - getCourseProgress called with courseId: $courseId');
      final user = _client.auth.currentUser;
      if (user == null) {
        return ApiResponse<Map<String, dynamic>>(
          statusCode: 401,
          data: {},
          message: ['User not authenticated'],
        );
      }

      // Obtener total de lecciones del curso
      final totalLessonsResponse =
          await _client.from('lessons').select('id').eq('course_id', courseId);

      final totalLessons = (totalLessonsResponse as List).length;

      // Obtener lecciones completadas
      final completedLessonsResponse = await _client
          .from('lesson_progress')
          .select('lesson_id')
          .eq('user_id', user.id)
          .eq('course_id', courseId)
          .eq('is_completed', true);

      final completedLessons = (completedLessonsResponse as List).length;

      final progressPercentage = totalLessons > 0
          ? (completedLessons / totalLessons * 100).round()
          : 0;

      final progressData = {
        'total_lessons': totalLessons,
        'completed_lessons': completedLessons,
        'progress_percentage': progressPercentage,
      };

      print('🔍 SupabaseCourseService - Course progress: $progressData');
      return ApiResponse<Map<String, dynamic>>(
        statusCode: 200,
        data: progressData,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseCourseService - Error getting course progress: $e');
      return ApiResponse<Map<String, dynamic>>(
        statusCode: 500,
        data: {},
        message: ['Error getting course progress: $e'],
      );
    }
  }
}
