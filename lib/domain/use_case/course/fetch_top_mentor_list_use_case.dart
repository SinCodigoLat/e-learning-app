import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/course/mentor_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchTopMentorListUseCase extends FutureUseCase<List<MentorEntity>, NoParam?> {
  final CourseRepo _repo;

  FetchTopMentorListUseCase(this._repo);

  @override
  Future<Result<List<MentorEntity>>> invoke(NoParam? param) {
    return _repo.fetchTopMentors();
  }
}
