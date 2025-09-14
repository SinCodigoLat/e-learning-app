import 'package:e_learning_app/base/repo/base_repo.dart';
import 'package:e_learning_app/data/data_source/remote/service/supabase_user_service.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/repo/user_repo.dart';
import 'package:e_learning_app/domain/use_case/user/update_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/helper/result.dart';
import '../mapper/user/user_mapper.dart';

@LazySingleton(as: UserRepo)
class UserRepoImpl extends BaseRepository implements UserRepo {
  final SupabaseUserService _userService;

  UserRepoImpl(this._userService);

  final BehaviorSubject<UserEntity> _profileStreamController =
      BehaviorSubject<UserEntity>.seeded(UserEntity.defaultValue());

  @override
  Future<Result<UserEntity>> fetchProfile() {
    print('📦 UserRepoImpl - fetchProfile called');
    return handleApiCall(_userService.fetchProfile(), mapper: (resp) {
      print('📦 UserRepoImpl - Processing API response');
      print('📦 UserRepoImpl - API response data: ${resp?.data}');
      final mappedEntity = UserMapper.mapToEntity(resp?.data);
      print('📦 UserRepoImpl - Mapped UserEntity:');
      print('📦   - id: ${mappedEntity.id}');
      print('📦   - fullName: ${mappedEntity.fullName}');
      print('📦   - email: ${mappedEntity.email}');
      print('📦   - avatar: ${mappedEntity.avatar}');
      print('📦   - phoneNumber: ${mappedEntity.phoneNumber}');
      print('📦   - bio: ${mappedEntity.bio}');
      print('📦   - location: ${mappedEntity.location}');
      print('📦   - gender: ${mappedEntity.gender}');
      print('📦   - birthday: ${mappedEntity.birthday}');
      return mappedEntity;
    }, saveResult: (data) {
      print('📦 UserRepoImpl - Adding data to profile stream');
      print('📦 UserRepoImpl - Data to add: ${data.fullName} (${data.email})');
      _profileStreamController.add(data);
      print('📦 UserRepoImpl - Data added to stream successfully');
      print(
          '📦 UserRepoImpl - Stream has ${_profileStreamController.hasValue} value');
      print(
          '📦 UserRepoImpl - Stream current value: ${_profileStreamController.value.fullName}');
    });
  }

  @override
  Stream<UserEntity> listenUserProfileStream() {
    print('📦 UserRepoImpl - listenUserProfileStream called');
    return _profileStreamController.stream.map((user) {
      print(
          '📦 UserRepoImpl - Stream emitting user: ${user.fullName} (${user.email})');
      return user;
    });
  }

  @override
  Future<Result<UserEntity>> updateProfile(UpdateProfileParam param) {
    return handleApiCall(
      _userService.updateProfile(param),
      mapper: (resp) => UserMapper.mapToEntity(resp?.data),
      saveResult: (data) {
        _profileStreamController.add(data);
      },
    );
  }
}
