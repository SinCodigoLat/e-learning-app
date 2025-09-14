import 'package:e_learning_app/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_response_dto.freezed.dart';
part 'course_response_dto.g.dart';

@freezed
class CourseResponseDto with _$CourseResponseDto {
  const factory CourseResponseDto({
    String? id,
    String? title,
    String? category,
    String? image,
    @JsonKey(name: 'image_url') String? imageUrl,
    double? rating,
    @JsonKey(name: 'reviews_count') int? reviewsCount,
    int? price,
    @JsonKey(name: 'original_price') int? originalPrice,
    int? students,
    @JsonKey(name: 'students_count') int? studentsCount,
    int? duration,
    @JsonKey(name: 'duration_hours') int? durationHours,
    bool? certificate,
    MentorResponseDto? mentor,
    String? about,
    String? description,
    List<ToolResponseDto>? tools,
    @JsonKey(name: 'is_favourite') bool? isFavourite,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    @JsonKey(name: 'views_count') int? viewsCount,
    @JsonKey(name: 'likes_count') int? likesCount,
    String? level,
    String? language,
    @JsonKey(name: 'popularity_score') double? popularityScore,
  }) = _CourseResponseDto;

  factory CourseResponseDto.fromJson(Map<String, Object?> json) =>
      _$CourseResponseDtoFromJson(json);
}

@freezed
class ToolResponseDto with _$ToolResponseDto {
  const factory ToolResponseDto({
    String? name,
    String? iconUrl,
  }) = _ToolResponseDto;

  factory ToolResponseDto.fromJson(Map<String, Object?> json) =>
      _$ToolResponseDtoFromJson(json);
}
