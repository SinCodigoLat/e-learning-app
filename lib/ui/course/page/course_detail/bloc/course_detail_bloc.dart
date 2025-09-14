import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/domain/entity/course/course_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/domain/use_case/course/enroll_course_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/check_user_enrollment_use_case.dart';
import 'package:e_learning_app/domain/use_case/course/fetch_course_detail_use_case.dart';
import 'package:e_learning_app/ui/course/page/course_detail/bloc/course_detail_event.dart';
import 'package:e_learning_app/ui/course/page/course_detail/bloc/course_detail_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_case/course/fetch_lesson_list_from_course_id_use_case.dart';
import '../../../../../domain/use_case/course/fetch_review_list_from_course_id_use_case.dart';
import '../../../../../domain/use_case/course/toggle_favourite_course_use_case.dart';

@injectable
final class CourseDetailBloc
    extends BaseBloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc(
    this._fetchCourseDetailUseCase,
    this._fetchLessonListFromCourseIdUseCase,
    this._fetchReviewListFromCourseIdUseCase,
    this._toggleFavouriteCourseUseCase,
    this._enrollCourseUseCase,
    this._checkUserEnrollmentUseCase,
  ) : super(CourseDetailState(
          course: CourseEntity.defaultValue(),
          tab: CourseTab.about,
          enrollmentSuccess: false,
          isEnrolled: false,
        )) {
    on<FetchCourseDetailEvent>(_onFetchCourseDetailEvent);
    on<CourseTabChangedEvent>(_onCourseTabChangedEvent);
    on<ToggleFavoriteCourseEvent>(_onToggleFavoriteCourseEvent);
    on<EnrollCourseRequestedEvent>(_onEnrollCourseRequestedEvent);
    on<ResetEnrollmentSuccessEvent>(_onResetEnrollmentSuccessEvent);
  }

  final FetchCourseDetailUseCase _fetchCourseDetailUseCase;
  final FetchLessonListFromCourseIdUseCase _fetchLessonListFromCourseIdUseCase;
  final FetchReviewListFromCourseIdUseCase _fetchReviewListFromCourseIdUseCase;
  final ToggleFavouriteCourseUseCase _toggleFavouriteCourseUseCase;
  final EnrollCourseUseCase _enrollCourseUseCase;
  final CheckUserEnrollmentUseCase _checkUserEnrollmentUseCase;

  FutureOr<void> _onFetchCourseDetailEvent(
      FetchCourseDetailEvent event, Emitter<CourseDetailState> emit) {
    return runAction(
      onAction: () async {
        final result = await _fetchCourseDetailUseCase
            .invoke(CourseDetailRequest(id: event.courseId));

        if (result.isSuccessful) {
          final course = result.when(
            ok: (data) => data,
            failure: (error) => null,
          );

          if (course != null) {
            emit(state.copyWith(course: course));

            // Verificar si el usuario ya está inscrito en el curso
            final isEnrolled =
                await _checkUserEnrollmentUseCase.invoke(event.courseId);
            print('🔍 CourseDetailBloc - User enrollment status: $isEnrolled');

            if (!emit.isDone) {
              print('🔍 CourseDetailBloc - Emitting isEnrolled: $isEnrolled');
              emit(state.copyWith(isEnrolled: isEnrolled));
              print('🔍 CourseDetailBloc - State emitted successfully');
            } else {
              print('🔍 CourseDetailBloc - Emit is done, cannot emit state');
            }
          }
        }
      },
    );
  }

  FutureOr<void> _onCourseTabChangedEvent(
      CourseTabChangedEvent event, Emitter<CourseDetailState> emit) {
    print('🔍 CourseDetailBloc - Tab changed to: ${event.tab}');
    switch (event.tab) {
      case CourseTab.about:
        return null;
      case CourseTab.lessons:
        return _fetchLesson(emit: emit);
      case CourseTab.reviews:
        return _fetchReview(emit: emit);
    }
  }

  Future<void> _fetchLesson({required Emitter<CourseDetailState> emit}) async {
    print(
        '🔍 CourseDetailBloc - _fetchLesson called, current lessons count: ${state.lessons.length}');
    if (state.lessons.isNotEmpty) {
      print('🔍 CourseDetailBloc - Lessons already loaded, skipping fetch');
      return;
    }
    return runAction(
      onAction: () async {
        print(
            '🔍 CourseDetailBloc - Fetching lessons for course: ${state.course.id}');
        final result =
            await _fetchLessonListFromCourseIdUseCase.invoke(state.course.id);
        result.when(
          ok: (data) {
            print(
                '🔍 CourseDetailBloc - Lessons fetched successfully: ${data?.length ?? 0} lessons');
            emit(state.copyWith(lessons: data ?? [], tab: CourseTab.lessons));
          },
          failure: (error) {
            print('🔍 CourseDetailBloc - Error fetching lessons: $error');
          },
        );
      },
    );
  }

  Future<void> _fetchReview({required Emitter<CourseDetailState> emit}) async {
    if (state.reviews.isNotEmpty) return;
    return runAction(
      onAction: () async {
        final result =
            await _fetchReviewListFromCourseIdUseCase.invoke(state.course.id);
        result.when(
          ok: (data) {
            emit(state.copyWith(reviews: data, tab: CourseTab.reviews));
          },
        );
      },
    );
  }

  FutureOr<void> _onToggleFavoriteCourseEvent(
      ToggleFavoriteCourseEvent event, Emitter<CourseDetailState> emit) {
    _toggleFavouriteCourseUseCase
        .invoke(ToggleFavouriteCourseInput(id: state.course.id, isFav: false));
  }

  FutureOr<void> _onEnrollCourseRequestedEvent(
      EnrollCourseRequestedEvent event, Emitter<CourseDetailState> emit) {
    return runAction(
      onAction: () async {
        final result = await _enrollCourseUseCase
            .invoke(EnrollCourseRequest(courseId: event.courseId));
        result.when(
          ok: (enrollment) {
            // Mostrar mensaje de éxito o navegar
            print(
                '✅ Successfully enrolled in course: ${enrollment?.courseId ?? 'Unknown'}');
            // Emitir estado de éxito para mostrar el diálogo
            print('🔍 CourseDetailBloc - Emitting enrollmentSuccess: true');
            emit(state.copyWith(enrollmentSuccess: true, isEnrolled: true));
            print('🔍 CourseDetailBloc - State emitted successfully');
          },
          failure: (error) {
            // Mostrar mensaje de error
            print('❌ Error enrolling in course: $error');
          },
        );
      },
    );
  }

  FutureOr<void> _onResetEnrollmentSuccessEvent(
      ResetEnrollmentSuccessEvent event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(enrollmentSuccess: false));
  }
}
