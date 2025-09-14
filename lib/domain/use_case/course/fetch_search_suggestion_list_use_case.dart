import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchSearchSuggestionListUseCase extends FutureUseCase<List<String>, NoParam?> {
  final CourseRepo _repo;

  FetchSearchSuggestionListUseCase(this._repo);

  @override
  Future<Result<List<String>>> invoke(NoParam? param) {
    return _repo.fetchSearchSuggestions();
  }
}
