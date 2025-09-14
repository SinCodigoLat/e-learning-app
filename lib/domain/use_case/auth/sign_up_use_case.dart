import 'package:e_learning_app/domain/entity/auth/auth_entity.dart';
import 'package:e_learning_app/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../base/helper/result.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  Future<Result<AuthEntity>> invoke({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await _authRepo.signUp(email, password, fullName);
  }
}
