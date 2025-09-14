import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/course/search_history_entity.dart';
import 'package:e_learning_app/domain/repo/course_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchSearchHistoryListUseCase extends FutureUseCase<List<SearchHistoryEntity>, NoParam?> {
  final CourseRepo _repo;

  FetchSearchHistoryListUseCase(this._repo);

  @override
  Future<Result<List<SearchHistoryEntity>>> invoke(NoParam? param) {
    return _repo.fetchSearchHistories();
  }
}
