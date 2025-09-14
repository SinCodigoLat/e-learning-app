import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
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
    return Scaffold(
      backgroundColor: AppColors.lightAppColor.scaffoldColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              color: AppColors.lightAppColor.greyscale900,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.moreCircleCurved.svg(
              colorFilter: ColorFilter.mode(
                  AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.paddingHorizontalLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileAvatarWidget(),
            const Gap(Dimens.paddingVerticalLarge),
            Divider(height: 1, color: AppColors.lightAppColor.greyscale200),
            const Gap(Dimens.paddingVerticalLarge),
            const ProfileSettingListViewWidget(),
          ],
        ),
      ),
    );
  }
}
