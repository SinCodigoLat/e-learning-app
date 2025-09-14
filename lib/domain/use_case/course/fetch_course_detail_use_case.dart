import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
final class FetchCourseDetailUseCase extends FutureUseCase<CourseEntity, CourseDetailRequest> {
  final CourseRepo _repo;

  FetchCourseDetailUseCase(this._repo);

  @override
  Future<Result<CourseEntity>> invoke(CourseDetailRequest param) {
    return _repo.fetchCourseDetail(param);
  }
}

class CourseDetailRequest {
  final String id;

  CourseDetailRequest({required this.id});
}
