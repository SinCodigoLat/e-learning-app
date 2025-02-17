import 'package:flutter_bloc_template/base/bloc/base_bloc/base_event.dart';

sealed class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

final class HomeDataRequestedEvent extends HomeEvent {}
