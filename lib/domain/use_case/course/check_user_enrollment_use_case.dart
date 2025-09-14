import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckUserEnrollmentUseCase {
  final CourseRepo _courseRepo;

  CheckUserEnrollmentUseCase(this._courseRepo);

  Future<bool> invoke(String courseId) async {
    final result = await _courseRepo.isUserEnrolled(courseId);
    return result.when(
          ok: (isEnrolled) => isEnrolled ?? false,
          failure: (error) => false,
        ) ??
        false;
  }
}
