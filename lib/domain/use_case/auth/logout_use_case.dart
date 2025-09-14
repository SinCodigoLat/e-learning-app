import 'package:flutter_bloc_template/base/helper/result.dart';
import 'package:flutter_bloc_template/base/use_case/base_use_case.dart';
import 'package:flutter_bloc_template/base/use_case/future_use_case.dart';
import 'package:flutter_bloc_template/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase extends FutureUseCase<void, NoParam?> {
  final AuthRepo _repo;

  LogoutUseCase(this._repo);

  @override
  Future<Result<void>> invoke(NoParam? param) {
    return _repo.logout();
  }
}
