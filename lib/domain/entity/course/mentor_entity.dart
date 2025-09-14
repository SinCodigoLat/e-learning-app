class MentorEntity {
  final String id;
  final String userId;
  final String name;
  final String title;
  final String avatarUrl;
  final String bio;
  final List<String> specializations;
  final int experienceYears;
  final double rating;
  final int totalStudents;
  final int totalCourses;
  final double? hourlyRate;
  final bool isAvailable;
  final List<String> languages;
  final Map<String, String> socialLinks;
  final List<String> achievements;

  MentorEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.title,
    required this.avatarUrl,
    this.bio = '',
    this.specializations = const [],
    this.experienceYears = 0,
    this.rating = 0.0,
    this.totalStudents = 0,
    this.totalCourses = 0,
    this.hourlyRate,
    this.isAvailable = true,
    this.languages = const ['English'],
    this.socialLinks = const {},
    this.achievements = const [],
  });

  static MentorEntity defaultValue() => MentorEntity(
    id: '', 
    userId: '', 
    name: '', 
    title: '', 
    avatarUrl: ''
  );
}
