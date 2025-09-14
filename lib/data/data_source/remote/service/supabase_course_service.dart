import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/category_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/course_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/lesson_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/review_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/promote_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/search_history_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/api_response.dart';

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
    // Mock data - replace with real Supabase query
    final mockData = [
      CategoryResponseDto(
        id: '1',
        name: 'Programming',
      ),
      CategoryResponseDto(
        id: '2',
        name: 'Design',
      ),
    ];

    return ApiResponse<List<CategoryResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<CourseResponseDto>>> fetchMostPopularCourse() async {
    // Mock data - replace with real Supabase query
    final mockData = [
      CourseResponseDto(
        id: '1',
        title: 'Flutter Development',
        category: 'Programming',
        image: 'https://via.placeholder.com/300x200',
        price: 99,
        originalPrice: 199,
        rating: 4.8,
        students: 1250,
        duration: 480, // 8 hours in minutes
        certificate: true,
        mentor: MentorResponseDto(
          id: '1',
          name: 'John Doe',
          title: 'Senior Flutter Developer',
          avatarUrl: 'https://via.placeholder.com/50x50',
        ),
        about: 'Learn Flutter from scratch',
        isFavourite: false,
      ),
    ];

    return ApiResponse<List<CourseResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<MentorResponseDto>>> fetchMentors() async {
    // Mock data - replace with real Supabase query
    final mockData = [
      MentorResponseDto(
        id: '1',
        name: 'John Doe',
        title: 'Senior Flutter Developer',
        avatarUrl: 'https://via.placeholder.com/100x100',
      ),
    ];

    return ApiResponse<List<MentorResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<CourseResponseDto>> fetchCourseFromId(String id) async {
    // Mock data - replace with real Supabase query
    final mockData = CourseResponseDto(
      id: id,
      title: 'Flutter Development',
      category: 'Programming',
      image: 'https://via.placeholder.com/300x200',
      price: 99,
      originalPrice: 199,
      rating: 4.8,
      students: 1250,
      duration: 480, // 8 hours in minutes
      certificate: true,
      mentor: MentorResponseDto(
        id: '1',
        name: 'John Doe',
        title: 'Senior Flutter Developer',
        avatarUrl: 'https://via.placeholder.com/50x50',
      ),
      about: 'Learn Flutter from scratch',
      isFavourite: false,
    );

    return ApiResponse<CourseResponseDto>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
  }

  Future<ApiResponse<List<LessonResponseDto>>> fetchLessonListFromCourseId(
      String courseId) async {
    // Mock data - replace with real Supabase query
    final mockData = [
      LessonResponseDto(
        id: '1',
        title: 'Introduction to Flutter',
        duration: 15, // 15 minutes
        videoUrl: 'https://example.com/video1.mp4',
        isFree: true,
      ),
    ];

    return ApiResponse<List<LessonResponseDto>>(
      statusCode: 200,
      data: mockData,
      message: ['Success'],
    );
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
}
