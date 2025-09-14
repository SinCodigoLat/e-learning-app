import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning_app/data/data_source/remote/dto/user/profile_response_dto.dart';
import 'package:e_learning_app/data/data_source/remote/dto/api_response.dart';
import 'package:e_learning_app/domain/use_case/user/update_profile_use_case.dart';

@lazySingleton
class SupabaseUserService {
  final SupabaseClient _client;

  SupabaseUserService(this._client);

  Future<ApiResponse<ProfileResponseDto>> fetchProfile() async {
    try {
      final user = _client.auth.currentUser;
      print('🔍 SupabaseUserService - fetchProfile called');
      print(
          '🔍 SupabaseUserService - Current user: ${user?.id} (${user?.email})');

      if (user == null) {
        print('🔍 SupabaseUserService - User not authenticated');
        return ApiResponse<ProfileResponseDto>(
          statusCode: 401,
          data: null,
          message: ['User not authenticated'],
        );
      }

      print(
          '🔍 SupabaseUserService - Fetching user data from Supabase for user ID: ${user.id}');

      // Fetch user data from the users table
      final response =
          await _client.from('users').select().eq('id', user.id).single();

      print(
          '🔍 SupabaseUserService - Raw Supabase response type: ${response.runtimeType}');
      print(
          '🔍 SupabaseUserService - Raw Supabase response keys: ${response.keys.toList()}');

      print('🔍 SupabaseUserService - Raw Supabase response:');
      print('🔍   - id: ${response['id']}');
      print('🔍   - full_name: ${response['full_name']}');
      print('🔍   - email: ${response['email']}');
      print('🔍   - avatar_url: ${response['avatar_url']}');
      print('🔍   - phone_number: ${response['phone_number']}');
      print('🔍   - bio: ${response['bio']}');
      print('🔍   - location: ${response['location']}');
      print('🔍   - gender: ${response['gender']}');
      print('🔍   - birthday: ${response['birthday']}');
      print('🔍   - created_at: ${response['created_at']}');
      print('🔍   - updated_at: ${response['updated_at']}');

      // Map the response to ProfileResponseDto
      final profileData = ProfileResponseDto(
        id: response['id'],
        name: response['full_name'] ?? 'User',
        email: user.email ??
            response['email'] ??
            '', // Use auth email if db email is empty
        avatar: response['avatar_url'],
        phone: response['phone_number'] ?? '',
        bio: response['bio'] ?? '',
        location: response['location'] ?? '',
        website: '',
        joinDate: response['created_at']?.toString() ?? '',
        courseCount: 0,
        completedCourses: 0,
        inProgressCourses: 0,
        totalHours: 0,
        certificates: 0,
        level: 'Beginner',
        achievements: [],
        socialLinks: {},
        gender: response['gender'] ?? '',
        birthday: response['birthday']?.toString() ?? '',
      );

      print('🔍 SupabaseUserService - Mapped ProfileResponseDto:');
      print('🔍   - id: ${profileData.id}');
      print('🔍   - name: ${profileData.name}');
      print('🔍   - email: ${profileData.email}');
      print('🔍   - avatar: ${profileData.avatar}');
      print('🔍   - phone: ${profileData.phone}');
      print('🔍   - bio: ${profileData.bio}');
      print('🔍   - location: ${profileData.location}');
      print('🔍   - gender: ${profileData.gender}');
      print('🔍   - birthday: ${profileData.birthday}');

      print('🔍 SupabaseUserService - Profile fetch successful');
      return ApiResponse<ProfileResponseDto>(
        statusCode: 200,
        data: profileData,
        message: ['Success'],
      );
    } catch (e) {
      print('🔍 SupabaseUserService - Error fetching profile: $e');
      return ApiResponse<ProfileResponseDto>(
        statusCode: 500,
        data: null,
        message: ['Error fetching profile: $e'],
      );
    }
  }

  Future<ApiResponse<ProfileResponseDto>> updateProfile(
      UpdateProfileParam param) async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return ApiResponse<ProfileResponseDto>(
          statusCode: 401,
          data: null,
          message: ['User not authenticated'],
        );
      }

      // Update user data in the users table
      final response = await _client
          .from('users')
          .update({
            if (param.fullName != null) 'full_name': param.fullName,
            if (param.email != null) 'email': param.email,
            if (param.phoneNumber != null) 'phone_number': param.phoneNumber,
            if (param.birthday != null)
              'birthday': param.birthday!.toIso8601String().split('T')[0],
            if (param.location != null) 'location': param.location,
            if (param.bio != null) 'bio': param.bio,
            if (param.avatar != null) 'avatar_url': param.avatar,
            if (param.gender != null) 'gender': param.gender,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id)
          .select()
          .single();

      // Map the response to ProfileResponseDto
      final updatedProfile = ProfileResponseDto(
        id: response['id'],
        name: response['full_name'] ?? '',
        email: response['email'] ?? '',
        avatar: response['avatar_url'],
        phone: response['phone_number'] ?? '',
        bio: response['bio'] ?? '',
        location: response['location'] ?? '',
        website: '',
        joinDate: response['created_at']?.toString() ?? '',
        courseCount: 0,
        completedCourses: 0,
        inProgressCourses: 0,
        totalHours: 0,
        certificates: 0,
        level: 'Beginner',
        achievements: [],
        socialLinks: {},
        gender: response['gender'] ?? '',
        birthday: response['birthday']?.toString() ?? '',
      );

      return ApiResponse<ProfileResponseDto>(
        statusCode: 200,
        data: updatedProfile,
        message: ['Profile updated successfully'],
      );
    } catch (e) {
      return ApiResponse<ProfileResponseDto>(
        statusCode: 500,
        data: null,
        message: ['Error updating profile: $e'],
      );
    }
  }
}
