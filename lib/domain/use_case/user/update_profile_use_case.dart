import 'package:e_learning_app/base/helper/result.dart';
import 'package:e_learning_app/base/use_case/future_use_case.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/repo/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase
    extends FutureUseCase<UserEntity, UpdateProfileParam> {
  final UserRepo _repo;

  UpdateProfileUseCase(this._repo);

  @override
  Future<Result<UserEntity>> invoke(UpdateProfileParam param) {
    return _repo.updateProfile(param);
  }
}

class UpdateProfileParam {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final DateTime? birthday;
  final String? location;
  final String? bio;
  final String? avatar;
  final String? gender;

  UpdateProfileParam({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.location,
    this.bio,
    this.avatar,
    this.gender,
  });
}
