import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_progress_entity.freezed.dart';
part 'lesson_progress_entity.g.dart';

@freezed
class LessonProgressEntity with _$LessonProgressEntity {
  const factory LessonProgressEntity({
    required String id,
    required String userId,
    required String lessonId,
    required String courseId,
    required bool isCompleted,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LessonProgressEntity;

  factory LessonProgressEntity.fromJson(Map<String, dynamic> json) =>
      _$LessonProgressEntityFromJson(json);
}
