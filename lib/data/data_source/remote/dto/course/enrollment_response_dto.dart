import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_response_dto.freezed.dart';
part 'enrollment_response_dto.g.dart';

@freezed
class EnrollmentResponseDto with _$EnrollmentResponseDto {
  const factory EnrollmentResponseDto({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'course_id') String? courseId,
    @JsonKey(name: 'enrolled_at') String? enrolledAt,
    String? status,
    @JsonKey(name: 'progress_percentage') int? progressPercentage,
    @JsonKey(name: 'last_accessed_at') String? lastAccessedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _EnrollmentResponseDto;

  factory EnrollmentResponseDto.fromJson(Map<String, Object?> json) =>
      _$EnrollmentResponseDtoFromJson(json);
}

@freezed
class EnrollCourseRequestDto with _$EnrollCourseRequestDto {
  const factory EnrollCourseRequestDto({
    @JsonKey(name: 'course_id') required String courseId,
  }) = _EnrollCourseRequestDto;

  factory EnrollCourseRequestDto.fromJson(Map<String, Object?> json) =>
      _$EnrollCourseRequestDtoFromJson(json);
}
