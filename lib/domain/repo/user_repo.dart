import 'package:e_learning_app/domain/entity/user/user_entity.dart';

import '../../base/helper/result.dart';

abstract class UserRepo {
  Future<Result<UserEntity>> fetchProfile();

  Stream<UserEntity> listenUserProfileStream();
}
