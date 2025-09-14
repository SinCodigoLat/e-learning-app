import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_template/base/bloc/base_bloc/base_event.dart';

abstract class LogoutEvent extends BaseEvent {
  const LogoutEvent();
}

class LogoutRequestedEvent extends LogoutEvent {
  const LogoutRequestedEvent() : super();
}
