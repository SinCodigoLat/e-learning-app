import 'package:equatable/equatable.dart';
import 'package:e_learning_app/base/bloc/base_bloc/base_event.dart';

abstract class LogoutEvent extends BaseEvent {
  const LogoutEvent();
}

class LogoutRequestedEvent extends LogoutEvent {
  const LogoutRequestedEvent() : super();
}
