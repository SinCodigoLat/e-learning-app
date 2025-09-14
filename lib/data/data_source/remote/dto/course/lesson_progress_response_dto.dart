class LessonProgressResponseDto {
  final String id;
  final String userId;
  final String lessonId;
  final String courseId;
  final bool isCompleted;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  LessonProgressResponseDto({
    required this.id,
    required this.userId,
    required this.lessonId,
    required this.courseId,
    required this.isCompleted,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LessonProgressResponseDto.fromJson(Map<String, dynamic> json) {
    return LessonProgressResponseDto(
      id: json['id'],
      userId: json['user_id'],
      lessonId: json['lesson_id'],
      courseId: json['course_id'],
      isCompleted: json['is_completed'],
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'lesson_id': lessonId,
      'course_id': courseId,
      'is_completed': isCompleted,
      'completed_at': completedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
