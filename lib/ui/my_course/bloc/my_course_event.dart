import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';

sealed class MyCourseEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

final class FetchUserCoursesEvent extends MyCourseEvent {}

final class MyCourseTabChangedEvent extends MyCourseEvent {
  final MyCourseTab tab;

  MyCourseTabChangedEvent({required this.tab});

  @override
  List<Object?> get props => [tab];
}
