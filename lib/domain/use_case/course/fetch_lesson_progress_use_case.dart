import 'package:e_learning_app/domain/entity/course/lesson_progress_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchLessonProgressUseCase {
  final CourseRepo _courseRepo;

  FetchLessonProgressUseCase(this._courseRepo);

  Future<List<LessonProgressEntity>> invoke(String courseId) async {
    final result = await _courseRepo.fetchLessonProgress(courseId);
    return result.when(
          ok: (progressList) => progressList ?? [],
          failure: (error) => [],
        ) ??
        [];
  }
}
