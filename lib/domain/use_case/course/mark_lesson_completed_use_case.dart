import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkLessonCompletedUseCase {
  final CourseRepo _courseRepo;

  MarkLessonCompletedUseCase(this._courseRepo);

  Future<bool> invoke(String lessonId, String courseId) async {
    final result = await _courseRepo.markLessonAsCompleted(lessonId, courseId);
    return result.when(
          ok: (progress) => progress != null,
          failure: (error) => false,
        ) ??
        false;
  }
}
