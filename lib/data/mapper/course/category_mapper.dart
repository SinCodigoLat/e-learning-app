import 'package:e_learning_app/data/data_source/remote/dto/course/category_response_dto.dart';
import 'package:e_learning_app/domain/entity/course/category_entity.dart';

abstract final class CategoryMapper {
  CategoryMapper._();

  static CategoryEntity mapToEntity(CategoryResponseDto? dto) {
    return CategoryEntity(
      id: dto?.id ?? '',
      name: dto?.name ?? '',
    );
  }
}
