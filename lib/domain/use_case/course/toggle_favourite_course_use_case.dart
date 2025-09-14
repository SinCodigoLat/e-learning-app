import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleFavouriteCourseUseCase extends FutureUseCase<ToggleFavouriteCourseOutput, ToggleFavouriteCourseInput> {
  final CourseRepo _repo;

  ToggleFavouriteCourseUseCase(this._repo);

  @override
  Future<Result<ToggleFavouriteCourseOutput>> invoke(ToggleFavouriteCourseInput param) {
    return _repo.toggleFavouriteCourse(param);
  }
}

class ToggleFavouriteCourseOutput {}

class ToggleFavouriteCourseInput {
  final String id;
  final bool isFav;

  ToggleFavouriteCourseInput({required this.id, required this.isFav});
}
