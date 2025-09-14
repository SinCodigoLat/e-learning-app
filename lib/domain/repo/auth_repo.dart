import 'package:e_learning_app/domain/entity/auth/auth_entity.dart';
import 'package:e_learning_app/domain/use_case/auth/login_use_case.dart';

import '../../base/helper/result.dart';

abstract class AuthRepo {
  Future<Result<AuthEntity>> login(LoginRequest req);
  Future<Result<AuthEntity>> signUp(
      String email, String password, String fullName);
  Future<Result<void>> logout();
}
