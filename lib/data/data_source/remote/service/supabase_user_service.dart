import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/user/profile_response_dto.dart';
import 'package:flutter_bloc_template/data/data_source/remote/dto/api_response.dart';

@lazySingleton
class SupabaseUserService {
  final SupabaseClient _client;

  SupabaseUserService(this._client);

  Future<ApiResponse<ProfileResponseDto>> fetchProfile() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return ApiResponse<ProfileResponseDto>(
          statusCode: 401,
          data: null,
          message: ['User not authenticated'],
        );
      }

      // Mock data for now - replace with real Supabase query
      final mockData = ProfileResponseDto(
        id: user.id,
        name: user.userMetadata?['name'] ?? 'User',
        email: user.email ?? '',
        avatar: user.userMetadata?['avatar_url'] ??
            'https://via.placeholder.com/100x100',
        phone: user.userMetadata?['phone'] ?? '',
        bio: 'Flutter Developer',
        location: 'New York, USA',
        website: 'https://example.com',
        joinDate: '2024-01-01',
        courseCount: 5,
        completedCourses: 3,
        inProgressCourses: 2,
        totalHours: 120,
        certificates: 3,
        level: 'Intermediate',
        achievements: ['First Course', 'Quiz Master', 'Perfect Score'],
        socialLinks: {
          'twitter': 'https://twitter.com/user',
          'linkedin': 'https://linkedin.com/in/user',
          'github': 'https://github.com/user',
        },
      );

      return ApiResponse<ProfileResponseDto>(
        statusCode: 200,
        data: mockData,
        message: ['Success'],
      );
    } catch (e) {
      return ApiResponse<ProfileResponseDto>(
        statusCode: 500,
        data: null,
        message: ['Error fetching profile: $e'],
      );
    }
  }

  Future<ApiResponse<ProfileResponseDto>> updateProfile(
      ProfileResponseDto profile) async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return ApiResponse<ProfileResponseDto>(
          statusCode: 401,
          data: null,
          message: ['User not authenticated'],
        );
      }

      // Update user metadata in Supabase
      await _client.auth.updateUser(
        UserAttributes(
          data: {
            'name': profile.name,
            'bio': profile.bio,
            'location': profile.location,
            'website': profile.website,
            'phone': profile.phone,
            'social_links': profile.socialLinks,
          },
        ),
      );

      return ApiResponse<ProfileResponseDto>(
        statusCode: 200,
        data: profile,
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
