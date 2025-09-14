import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning_app/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/api_response.dart';

@lazySingleton
class SupabaseMentorService {
  final SupabaseClient _client;

  SupabaseMentorService(this._client);

  Future<ApiResponse<List<MentorResponseDto>>> fetchTopMentors() async {
    try {
      print('🔍 SupabaseMentorService - fetchTopMentors called');

      // Fetch mentors from the mentors table, ordered by rating and total_students
      final response = await _client
          .from('mentors')
          .select()
          .eq('is_available', true)
          .order('rating', ascending: false)
          .order('total_students', ascending: false)
          .limit(10);

      print('🔍 SupabaseMentorService - Raw Supabase response: $response');

      final mentors = (response as List)
          .map((mentor) => MentorResponseDto.fromJson(mentor))
          .toList();

      print('🔍 SupabaseMentorService - Mapped mentors: ${mentors.length}');

      return ApiResponse<List<MentorResponseDto>>(
        statusCode: 200,
        data: mentors,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseMentorService - Error: $e');
      return ApiResponse<List<MentorResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching mentors: $e'],
      );
    }
  }

  Future<ApiResponse<List<MentorResponseDto>>> fetchAllMentors() async {
    try {
      print('🔍 SupabaseMentorService - fetchAllMentors called');

      // Fetch all available mentors
      final response = await _client
          .from('mentors')
          .select()
          .eq('is_available', true)
          .order('rating', ascending: false);

      print('🔍 SupabaseMentorService - Raw Supabase response: $response');

      final mentors = (response as List)
          .map((mentor) => MentorResponseDto.fromJson(mentor))
          .toList();

      print('🔍 SupabaseMentorService - Mapped mentors: ${mentors.length}');

      return ApiResponse<List<MentorResponseDto>>(
        statusCode: 200,
        data: mentors,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseMentorService - Error: $e');
      return ApiResponse<List<MentorResponseDto>>(
        statusCode: 500,
        data: [],
        message: ['Error fetching mentors: $e'],
      );
    }
  }

  Future<ApiResponse<MentorResponseDto>> fetchMentorById(String id) async {
    try {
      print('🔍 SupabaseMentorService - fetchMentorById called with id: $id');

      final response = await _client
          .from('mentors')
          .select()
          .eq('id', id)
          .single();

      print('🔍 SupabaseMentorService - Raw Supabase response: $response');

      final mentor = MentorResponseDto.fromJson(response);

      return ApiResponse<MentorResponseDto>(
        statusCode: 200,
        data: mentor,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseMentorService - Error: $e');
      return ApiResponse<MentorResponseDto>(
        statusCode: 500,
        data: MentorResponseDto(),
        message: ['Error fetching mentor: $e'],
      );
    }
  }
}
