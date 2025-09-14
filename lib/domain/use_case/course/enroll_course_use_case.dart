import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/course/enrollment_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
final class EnrollCourseUseCase
    extends FutureUseCase<EnrollmentEntity, EnrollCourseRequest> {
  final CourseRepo _repo;

  EnrollCourseUseCase(this._repo);

  @override
  Future<Result<EnrollmentEntity>> invoke(EnrollCourseRequest param) {
    return _repo.enrollCourse(param);
  }
}

class EnrollCourseRequest {
  final String courseId;

  EnrollCourseRequest({required this.courseId});
}
