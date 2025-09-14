import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:e_learning_app/base/helper/duration_provider.dart';
import 'package:e_learning_app/base/shared_view/common_app_bar.dart';
import 'package:e_learning_app/base/shared_view/common_scaffold.dart';
import 'package:e_learning_app/base/shared_view/foundation_state.dart';
import 'package:e_learning_app/domain/entity/enum/enum.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:e_learning_app/ui/profile/pages/setting_notification/bloc/setting_notification_bloc.dart';

@RoutePage()
class SettingNotificationPage extends StatefulWidget {
  const SettingNotificationPage({super.key});

  @override
  State<SettingNotificationPage> createState() => _SettingNotificationPageState();
}

class _SettingNotificationPageState extends FoundationState<SettingNotificationPage, SettingNotificationBloc> {
  List<NotificationSetting> _selects = [];

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(text: 'Notification', centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.paddingVerticalLarge),
        child: Column(
          children: NotificationSetting.values.map<Widget>((e) => _item(e)).toList(),
        ),
      ),
    );
  }

  _item(NotificationSetting e) {
    bool enable = _selects.contains(e);
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(e.fromTitle(), style: AppTextStyles.bodyXLargeSemiBold),
          GestureDetector(
            onTap: () {
              setState(() {
                if (enable) {
                  _selects.remove(e);
                } else {
                  _selects.add(e);
                }
              });
            },
            behavior: HitTestBehavior.opaque,
            child: AnimatedSwitcher(
              duration: const ShortDuration(),
              transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
              child: SizedBox(
                key: ValueKey('setting-$enable'),
                child: enable ? Assets.icons.toggleEnable.svg() : Assets.icons.toggleDisabled.svg(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
