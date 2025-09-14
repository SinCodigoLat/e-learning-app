import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCourseProgressUseCase {
  final CourseRepo _courseRepo;

  GetCourseProgressUseCase(this._courseRepo);

  Future<Map<String, dynamic>> invoke(String courseId) async {
    final result = await _courseRepo.getCourseProgress(courseId);
    return result.when(
          ok: (progressData) => progressData ?? {},
          failure: (error) => {},
        ) ??
        {};
  }
}
