class LessonResponseDto {
  final String id;
  final String title;
  final int duration;
  final String videoUrl;
  final bool isFree;

  LessonResponseDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoUrl,
    required this.isFree,
  });

  factory LessonResponseDto.fromJson(Map<String, dynamic> json) {
    return LessonResponseDto(
      id: json['id'],
      title: json['title'],
      duration: json['duration'],
      videoUrl: json['video_url'] ?? '',
      isFree: json['is_free'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'video_url': videoUrl,
      'is_free': isFree,
    };
  }
}
