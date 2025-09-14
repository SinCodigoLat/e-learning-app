class ProfileResponseDto {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String phone;
  final String bio;
  final String location;
  final String website;
  final String joinDate;
  final int courseCount;
  final int completedCourses;
  final int inProgressCourses;
  final int totalHours;
  final int certificates;
  final String level;
  final List<String> achievements;
  final Map<String, String> socialLinks;
  final String? gender;
  final String? birthday;

  ProfileResponseDto({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.bio,
    required this.location,
    required this.website,
    required this.joinDate,
    required this.courseCount,
    required this.completedCourses,
    required this.inProgressCourses,
    required this.totalHours,
    required this.certificates,
    required this.level,
    required this.achievements,
    required this.socialLinks,
    this.gender,
    this.birthday,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return ProfileResponseDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      phone: json['phone'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
      website: json['website'] ?? '',
      joinDate: json['joinDate'] ?? '',
      courseCount: json['courseCount'] ?? 0,
      completedCourses: json['completedCourses'] ?? 0,
      inProgressCourses: json['inProgressCourses'] ?? 0,
      totalHours: json['totalHours'] ?? 0,
      certificates: json['certificates'] ?? 0,
      level: json['level'] ?? '',
      achievements: List<String>.from(json['achievements'] ?? []),
      socialLinks: Map<String, String>.from(json['socialLinks'] ?? {}),
      gender: json['gender'],
      birthday: json['birthday'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'bio': bio,
      'location': location,
      'website': website,
      'joinDate': joinDate,
      'courseCount': courseCount,
      'completedCourses': completedCourses,
      'inProgressCourses': inProgressCourses,
      'totalHours': totalHours,
      'certificates': certificates,
      'level': level,
      'achievements': achievements,
      'socialLinks': socialLinks,
      'gender': gender,
      'birthday': birthday,
    };
  }
}
