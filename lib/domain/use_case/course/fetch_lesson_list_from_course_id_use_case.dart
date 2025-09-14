import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/course/lesson_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
final class FetchLessonListFromCourseIdUseCase extends FutureUseCase<List<LessonEntity>, String> {
  final CourseRepo _repo;

  FetchLessonListFromCourseIdUseCase(this._repo);

  @override
  Future<Result<List<LessonEntity>>> invoke(String param) {
    return _repo.fetchLessonListFromCourseId(param);
  }
}
