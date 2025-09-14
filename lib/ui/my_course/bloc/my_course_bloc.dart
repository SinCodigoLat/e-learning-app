import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/domain/entity/course/user_course_entity.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/domain/use_case/course/fetch_user_courses_use_case.dart';
import 'package:e_learning_app/ui/my_course/bloc/my_course_event.dart';
import 'package:e_learning_app/ui/my_course/bloc/my_course_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class MyCourseBloc extends BaseBloc<MyCourseEvent, MyCourseState> {
  final FetchUserCoursesUseCase _fetchUserCoursesUseCase;

  MyCourseBloc(this._fetchUserCoursesUseCase) : super(MyCourseState()) {
    on<FetchUserCoursesEvent>(_onFetchUserCoursesEvent);
    on<MyCourseTabChangedEvent>(_onMyCourseTabChangedEvent);
  }

  FutureOr<void> _onFetchUserCoursesEvent(
      FetchUserCoursesEvent event, Emitter<MyCourseState> emit) {
    return runAction(
      onAction: () async {
        final userCourses = await _fetchUserCoursesUseCase.invoke();
        print('🔍 MyCourseBloc - Fetched ${userCourses.length} user courses');
        
        // Separar cursos en progreso y completados
        final ongoingCourses = userCourses.where((uc) => uc.isOngoing).toList();
        final completedCourses = userCourses.where((uc) => uc.isCompleted).toList();
        
        emit(state.copyWith(
          userCourses: userCourses,
          ongoingCourses: ongoingCourses,
          completedCourses: completedCourses,
        ));
      },
    );
  }

  FutureOr<void> _onMyCourseTabChangedEvent(
      MyCourseTabChangedEvent event, Emitter<MyCourseState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }
}
