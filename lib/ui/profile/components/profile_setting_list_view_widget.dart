import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/di/di.dart';
import 'package:e_learning_app/navigation/router.gr.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:e_learning_app/ui/profile/bloc/logout_bloc.dart';
import 'package:e_learning_app/ui/profile/bloc/logout_event.dart';
import 'package:e_learning_app/ui/profile/bloc/logout_state.dart';
import 'package:gap/gap.dart';

import '../../../base/constants/ui/app_colors.dart';

class ProfileSettingListViewWidget extends StatelessWidget {
  const ProfileSettingListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SL.get<LogoutBloc>(),
      child: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state.isLoggedOut) {
            // Navigate to login screen
            AutoRouter.of(context).push(const LoginRoute());
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Logout failed: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _item(
              onTap: () {
                AutoRouter.of(context).push(const EditProfileRoute());
              },
              label: 'Edit Profile',
              icon: Assets.icons.profileCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () =>
                  AutoRouter.of(context).push(const SettingNotificationRoute()),
              label: 'Notification',
              icon: Assets.icons.notificationCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () =>
                  AutoRouter.of(context).push(const SettingPaymentRoute()),
              label: 'Payment',
              icon: Assets.icons.walletCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () {},
              label: 'Security',
              icon: Assets.icons.shieldDoneCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () =>
                  AutoRouter.of(context).push(const SettingNotificationRoute()),
              label: 'Language',
              icon: Assets.icons.moreCircleCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('English (US)',
                      style: TextStyle(
                          color: AppColors.lightAppColor.greyscale900)),
                  const Gap(20),
                  Assets.icons.arrowRight2.svg(
                    colorFilter: ColorFilter.mode(
                        AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
            // Dark Mode option hidden for now - app only supports light mode
            // _item(
            //   onTap: () {},
            //   label: 'Dark Mode',
            //   icon: Assets.icons.showCurved.svg(
            //     colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            //   ),
            //   trailing: const ThemeToggleWidget(),
            //   textColor: textColor,
            //   iconColor: iconColor,
            // ),
            _item(
              onTap: () {},
              label: 'Privacy Policy',
              icon: Assets.icons.lockCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () => AutoRouter.of(context).push(const HelpCenterRoute()),
              label: 'Help Center',
              icon: Assets.icons.infoSquareCurved.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () {},
              label: 'Invite Friends',
              icon: Assets.icons.usersCurve.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
              ),
            ),
            _item(
              onTap: () {
                context.read<LogoutBloc>().add(const LogoutRequestedEvent());
              },
              label: 'Logout',
              labelStyle: AppTextStyles.bodyXLargeBold
                  .copyWith(color: AppColors.lightAppColor.error),
              icon: Assets.icons.logoutCurved.svg(
                  colorFilter: ColorFilter.mode(
                AppColors.lightAppColor.error,
                BlendMode.srcIn,
              )),
              trailing: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({
    required VoidCallback? onTap,
    required String label,
    required Widget icon,
    Widget? trailing,
    TextStyle? labelStyle,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const Gap(20),
                Text(
                  label,
                  style: labelStyle ??
                      AppTextStyles.bodyXLargeBold.copyWith(
                          color: AppColors.lightAppColor.greyscale900),
                ),
              ],
            ),
            trailing ??
                Assets.icons.arrowRight2.svg(
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                      AppColors.lightAppColor.greyscale900, BlendMode.srcIn),
                ),
          ],
        ),
      ),
    );
  }
}
