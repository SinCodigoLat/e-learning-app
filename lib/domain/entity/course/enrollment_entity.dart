class EnrollmentEntity {
  final String id;
  final String userId;
  final String courseId;
  final DateTime enrolledAt;
  final String status;
  final int progressPercentage;
  final DateTime lastAccessedAt;
  final DateTime? completedAt;

  EnrollmentEntity({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.enrolledAt,
    required this.status,
    required this.progressPercentage,
    required this.lastAccessedAt,
    this.completedAt,
  });

  static EnrollmentEntity defaultValue() => EnrollmentEntity(
        id: '',
        userId: '',
        courseId: '',
        enrolledAt: DateTime.now(),
        status: 'active',
        progressPercentage: 0,
        lastAccessedAt: DateTime.now(),
      );
}
