import 'package:e_learning_app/data/data_source/remote/dto/course/lesson_progress_response_dto.dart';
import 'package:e_learning_app/domain/entity/course/lesson_progress_entity.dart';

class LessonProgressMapper {
  static LessonProgressEntity mapToEntity(LessonProgressResponseDto dto) {
    return LessonProgressEntity(
      id: dto.id,
      userId: dto.userId,
      lessonId: dto.lessonId,
      courseId: dto.courseId,
      isCompleted: dto.isCompleted,
      completedAt: dto.completedAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
