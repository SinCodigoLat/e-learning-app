import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/use_case/user/update_profile_use_case.dart';

import '../../base/helper/result.dart';

abstract class UserRepo {
  Future<Result<UserEntity>> fetchProfile();

  Stream<UserEntity> listenUserProfileStream();

  Future<Result<UserEntity>> updateProfile(UpdateProfileParam param);
}
