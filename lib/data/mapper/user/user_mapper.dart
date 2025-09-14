import 'package:e_learning_app/data/data_source/remote/dto/user/profile_response_dto.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';

abstract final class UserMapper {
  static UserEntity mapToEntity(ProfileResponseDto? dto) {
    // Parse birthday from string to DateTime
    DateTime birthday = DateTime.now();
    if (dto?.birthday != null) {
      try {
        birthday = DateTime.parse(dto!.birthday!);
      } catch (e) {
        // If parsing fails, use current date
        birthday = DateTime.now();
      }
    }

    // Parse gender from string to enum
    Gender? gender;
    if (dto?.gender != null) {
      try {
        gender = Gender.values.firstWhere(
          (g) => g.name.toLowerCase() == dto!.gender!.toLowerCase(),
          orElse: () => Gender.male, // Default to male if not found
        );
      } catch (e) {
        gender = Gender.male; // Default to male if parsing fails
      }
    }

    return UserEntity(
      id: dto?.id ?? '',
      fullName: dto?.name ?? '',
      email: dto?.email ?? '',
      avatar: dto?.avatar ?? '',
      bio: dto?.bio ?? '',
      phoneNumber: dto?.phone ?? '',
      birthday: birthday,
      location: dto?.location ?? '',
      role: 'Student', // Default role
      gender: gender,
    );
  }
}
