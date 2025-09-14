import 'package:e_learning_app/data/data_source/remote/dto/course/review_response_dto.dart';
import 'package:e_learning_app/domain/entity/course/review_entity.dart';

abstract final class ReviewMapper {
  static ReviewEntity mapToEntity(ReviewResponseDto? dto) {
    return ReviewEntity(
      id: dto?.id ?? '',
      courseId: dto?.courseId ?? '',
      userId: dto?.userId ?? '',
      rating: dto?.rating ?? .0,
      comment: dto?.comment ?? '',
      createdAt: dto?.createdAt ??'',
    );
  }
}
