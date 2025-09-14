import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/repo/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchProfileUseCase extends FutureUseCase<UserEntity, NoParam?> {
  final UserRepo _repo;

  FetchProfileUseCase(this._repo);

  @override
  Future<Result<UserEntity>> invoke(NoParam? param) {
    return _repo.fetchProfile();
  }
}
