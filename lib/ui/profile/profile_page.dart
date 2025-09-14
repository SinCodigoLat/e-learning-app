import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:e_learning_app/base/shared_view/common_app_bar.dart';
import 'package:e_learning_app/base/shared_view/common_scaffold.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:e_learning_app/ui/profile/components/profile_avatar_widget.dart';
import 'package:gap/gap.dart';

import '../../base/constants/ui/app_colors.dart';
import 'components/profile_setting_list_view_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Profile',
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        leadingIcon: LeadingIcon.none,
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Assets.icons.moreCircleCurved.svg()),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.paddingHorizontalLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileAvatarWidget(),
            const Gap(Dimens.paddingVerticalLarge),
            Divider(height: 1, color: AppColors.current.greyscale200),
            const Gap(Dimens.paddingVerticalLarge),
            const ProfileSettingListViewWidget(),
          ],
        ),
      ),
    );
  }
}
