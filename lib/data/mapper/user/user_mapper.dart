import 'package:flutter_bloc_template/data/data_source/remote/dto/user/profile_response_dto.dart';
import 'package:flutter_bloc_template/domain/entity/user/user_entity.dart';

abstract final class UserMapper {
  static UserEntity mapToEntity(ProfileResponseDto? dto) {
    return UserEntity(
      id: dto?.id ?? '',
      fullName: dto?.name ?? '',
      email: dto?.email ?? '',
      avatar: dto?.avatar ?? '',
      bio: dto?.bio ?? '',
      phoneNumber: dto?.phone ?? '',
      birthday: DateTime.now(), // Default birthday
      location: dto?.location ?? '',
      role: 'Student', // Default role
    );
  }
}
