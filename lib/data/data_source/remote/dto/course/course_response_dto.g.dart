// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseDtoImpl _$$CourseResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseResponseDtoImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewsCount: (json['reviews_count'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      originalPrice: (json['original_price'] as num?)?.toInt(),
      students: (json['students'] as num?)?.toInt(),
      studentsCount: (json['students_count'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      durationHours: (json['duration_hours'] as num?)?.toInt(),
      certificate: json['certificate'] as bool?,
      mentor: json['mentor'] == null
          ? null
          : MentorResponseDto.fromJson(json['mentor'] as Map<String, dynamic>),
      about: json['about'] as String?,
      description: json['description'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => ToolResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavourite: json['is_favourite'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      viewsCount: (json['views_count'] as num?)?.toInt(),
      likesCount: (json['likes_count'] as num?)?.toInt(),
      level: json['level'] as String?,
      language: json['language'] as String?,
      popularityScore: (json['popularity_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CourseResponseDtoImplToJson(
        _$CourseResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'students': instance.students,
      'students_count': instance.studentsCount,
      'duration': instance.duration,
      'duration_hours': instance.durationHours,
      'certificate': instance.certificate,
      'mentor': instance.mentor,
      'about': instance.about,
      'description': instance.description,
      'tools': instance.tools,
      'is_favourite': instance.isFavourite,
      'is_featured': instance.isFeatured,
      'views_count': instance.viewsCount,
      'likes_count': instance.likesCount,
      'level': instance.level,
      'language': instance.language,
      'popularity_score': instance.popularityScore,
    };

_$ToolResponseDtoImpl _$$ToolResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ToolResponseDtoImpl(
      name: json['name'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$ToolResponseDtoImplToJson(
        _$ToolResponseDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };
