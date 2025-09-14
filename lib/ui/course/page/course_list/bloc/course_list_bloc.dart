
import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/ui/course/page/course_list/bloc/course_list_event.dart';
import 'package:e_learning_app/ui/course/page/course_list/bloc/course_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CourseListBloc extends BaseBloc<CourseListEvent, CourseListState> {
  CourseListBloc() : super(CourseListState());
}