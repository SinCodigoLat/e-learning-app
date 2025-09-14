import 'package:e_learning_app/data/data_source/remote/dto/course/enrollment_response_dto.dart';
import 'package:e_learning_app/domain/entity/course/enrollment_entity.dart';

abstract final class EnrollmentMapper {
  static EnrollmentEntity mapToEntity(EnrollmentResponseDto? dto) {
    return EnrollmentEntity(
      id: dto?.id ?? '',
      userId: dto?.userId ?? '',
      courseId: dto?.courseId ?? '',
      enrolledAt: dto?.enrolledAt != null
          ? DateTime.parse(dto!.enrolledAt!)
          : DateTime.now(),
      status: dto?.status ?? 'active',
      progressPercentage: dto?.progressPercentage ?? 0,
      lastAccessedAt: dto?.lastAccessedAt != null
          ? DateTime.parse(dto!.lastAccessedAt!)
          : DateTime.now(),
      completedAt:
          dto?.completedAt != null ? DateTime.parse(dto!.completedAt!) : null,
    );
  }
}
