import 'package:e_learning_app/domain/entity/course/user_course_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchUserCoursesUseCase {
  final CourseRepo _courseRepo;

  FetchUserCoursesUseCase(this._courseRepo);

  Future<List<UserCourseEntity>> invoke() async {
    final result = await _courseRepo.fetchUserCoursesWithDetails();
    return result.when(
      ok: (userCourses) => userCourses ?? [],
      failure: (error) => [],
    ) ?? [];
  }
}
