import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';

sealed class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

final class HomeDataRequestedEvent extends HomeEvent {}

final class HomeCategoryChangedEvent extends HomeEvent {
  final String id;

  HomeCategoryChangedEvent(this.id);

  @override
  List<Object?> get props => [id];
}

