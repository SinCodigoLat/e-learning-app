import 'package:e_learning_app/domain/entity/enum/enum.dart';

class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String avatar;
  final String bio;
  final String phoneNumber;
  final DateTime birthday;
  final String location;
  final String role;
  final Gender? gender;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatar,
    required this.bio,
    required this.phoneNumber,
    required this.birthday,
    required this.location,
    required this.role,
    this.gender,
  });

  static UserEntity defaultValue() {
    return UserEntity(
      id: '',
      fullName: '',
      email: '',
      avatar: '',
      bio: '',
      phoneNumber: '',
      birthday: DateTime.now(),
      location: '',
      role: '',
      gender: null,
    );
  }
}
