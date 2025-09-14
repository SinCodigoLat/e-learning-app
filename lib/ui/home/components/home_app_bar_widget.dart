import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:e_learning_app/base/shared_view/common_image_view.dart';
import 'package:e_learning_app/base/helper/avatar_helper.dart';
import 'package:e_learning_app/di/di.dart';
import 'package:e_learning_app/domain/entity/user/user_entity.dart';
import 'package:e_learning_app/domain/use_case/user/listen_user_profile_stream_use_case.dart';
import 'package:e_learning_app/resource/generated/assets.gen.dart';
import 'package:gap/gap.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingHorizontalLarge),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<UserEntity>(
                stream: SL.get<ListenUserProfileStreamUseCase>().invoke(),
                initialData: UserEntity.defaultValue(),
                builder: (_, snapshot) {
                  print(
                      '🏠 HomeAppBar - Snapshot state: ${snapshot.connectionState}');
                  print(
                      '🏠 HomeAppBar - Snapshot has data: ${snapshot.hasData}');
                  final user = snapshot.data ?? UserEntity.defaultValue();
                  print(
                      '🏠 HomeAppBar - StreamBuilder data: ${user.fullName} (${user.email})');
                  print('🏠 HomeAppBar - User ID: ${user.id}');
                  print('🏠 HomeAppBar - Avatar: ${user.avatar}');
                  return Row(
                    children: [
                      CommonImageView.circle(
                        imageUrl: AvatarHelper.getAvatarUrl(
                          userImageUrl: user.avatar,
                          email: user.email,
                          userId: user.id,
                          fullName: user.fullName,
                          size: 48,
                        ),
                        size: 48,
                      ),
                      const Gap(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Good Morning 👋',
                              style: AppTextStyles.bodyLargeRegular),
                          Text(user.fullName, style: AppTextStyles.h5Bold),
                        ],
                      )
                    ],
                  );
                },
              ),
              const Gap(16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Assets.icons.notificationCurved.svg(),
                  ),
                  const Gap(16),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Assets.icons.bookmarkCurved.svg(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}
