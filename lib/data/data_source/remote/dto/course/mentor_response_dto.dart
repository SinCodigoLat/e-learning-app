import 'package:freezed_annotation/freezed_annotation.dart';
part 'mentor_response_dto.freezed.dart';
part 'mentor_response_dto.g.dart';

@freezed
class MentorResponseDto with _$MentorResponseDto {
  const factory MentorResponseDto({
    String? id,
    String? userId,
    String? name,
    String? title,
    String? avatarUrl,
    String? bio,
    @Default([]) List<String> specializations,
    @Default(0) int experienceYears,
    @Default(0.0) double rating,
    @Default(0) int totalStudents,
    @Default(0) int totalCourses,
    double? hourlyRate,
    @Default(true) bool isAvailable,
    @Default(['English']) List<String> languages,
    @Default({}) Map<String, String> socialLinks,
    @Default([]) List<String> achievements,
  }) = _MentorResponseDto;

  factory MentorResponseDto.fromJson(Map<String, Object?> json) => _$MentorResponseDtoFromJson(json);
}
