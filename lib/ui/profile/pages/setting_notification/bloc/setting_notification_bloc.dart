import 'package:e_learning_app/base/bloc/base_bloc/base_bloc.dart';
import 'package:e_learning_app/ui/profile/pages/setting_notification/bloc/setting_notification_event.dart';
import 'package:e_learning_app/ui/profile/pages/setting_notification/bloc/setting_notification_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class SettingNotificationBloc extends BaseBloc<SettingNotificationEvent, SettingNotificationState> {
  SettingNotificationBloc() : super(SettingNotificationState());
}