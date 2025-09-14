import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entity/auth/auth_entity.dart';

@injectable
final class LoginUseCase extends FutureUseCase<AuthEntity, LoginRequest> {
  final AuthRepo _repo;

  LoginUseCase(this._repo);

  @override
  Future<Result<AuthEntity>> invoke(LoginRequest param) {
    return _repo.login(param);
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}
