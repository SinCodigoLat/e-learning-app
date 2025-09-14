import 'package:e_learning_app/data/data_source/remote/dto/course/mentor_response_dto.dart';
import 'package:e_learning_app/domain/entity/course/mentor_entity.dart';

abstract final class MentorMapper {
  static MentorEntity mapToEntity(MentorResponseDto? dto) {
    return MentorEntity(
      id: dto?.id ?? '',
      userId: dto?.userId ?? '',
      name: dto?.name ?? '',
      title: dto?.title ?? '',
      avatarUrl: dto?.avatarUrl ?? '',
      bio: dto?.bio ?? '',
      specializations: dto?.specializations ?? [],
      experienceYears: dto?.experienceYears ?? 0,
      rating: dto?.rating ?? 0.0,
      totalStudents: dto?.totalStudents ?? 0,
      totalCourses: dto?.totalCourses ?? 0,
      hourlyRate: dto?.hourlyRate,
      isAvailable: dto?.isAvailable ?? true,
      languages: dto?.languages ?? ['English'],
      socialLinks: dto?.socialLinks ?? {},
      achievements: dto?.achievements ?? [],
    );
  }
}
