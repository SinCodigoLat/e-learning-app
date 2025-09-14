import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';
import 'package:e_learning_app/base/constants/ui/dimens.dart';
import 'package:e_learning_app/domain/entity/course/mentor_entity.dart';
import 'package:e_learning_app/base/shared_view/common_image_view.dart';
import 'package:gap/gap.dart';

class HomeTopMentorsWidget extends StatelessWidget {
  const HomeTopMentorsWidget({super.key, required this.items});

  final List<MentorEntity> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Mentors', style: AppTextStyles.h5Bold),
            Text('See All',
                style: AppTextStyles.bodyLargeBold.withPrimaryColor()),
          ],
        ),
        const Gap(Dimens.paddingVerticalLarge),
        SizedBox(
          height: 110,
          child: ListView.separated(
            separatorBuilder: (_, __) => const Gap(Dimens.paddingHorizontal),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _item(items[index]),
          ),
        )
      ],
    );
  }

  Widget _item(MentorEntity item) {
    return SizedBox(
      width: 80,
      height: 110,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImageView(
            imageUrl: item.avatarUrl.isNotEmpty
                ? item.avatarUrl
                : 'https://api.dicebear.com/7.x/avataaars/svg?seed=${item.name}',
            width: 50,
            height: 50,
            radius: 25,
          ),
          const Gap(6),
          Flexible(
            child: Text(
              item.name,
              style: AppTextStyles.bodyMediumSemiBold,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(2),
          Flexible(
            child: Text(
              item.title,
              style: AppTextStyles.bodyXSmallRegular.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                size: 10,
                color: Colors.amber[600],
              ),
              const Gap(1),
              Text(
                item.rating.toStringAsFixed(1),
                style: AppTextStyles.bodyXSmallRegular.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
