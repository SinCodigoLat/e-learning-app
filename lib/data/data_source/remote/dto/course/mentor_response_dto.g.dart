// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MentorResponseDtoImpl _$$MentorResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MentorResponseDtoImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      specializations: (json['specializations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      experienceYears: (json['experienceYears'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalStudents: (json['totalStudents'] as num?)?.toInt() ?? 0,
      totalCourses: (json['totalCourses'] as num?)?.toInt() ?? 0,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['English'],
      socialLinks: (json['socialLinks'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MentorResponseDtoImplToJson(
        _$MentorResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'title': instance.title,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'specializations': instance.specializations,
      'experienceYears': instance.experienceYears,
      'rating': instance.rating,
      'totalStudents': instance.totalStudents,
      'totalCourses': instance.totalCourses,
      'hourlyRate': instance.hourlyRate,
      'isAvailable': instance.isAvailable,
      'languages': instance.languages,
      'socialLinks': instance.socialLinks,
      'achievements': instance.achievements,
    };
