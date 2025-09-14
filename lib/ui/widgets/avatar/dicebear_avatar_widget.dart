import 'package:flutter/material.dart';
import 'package:e_learning_app/base/shared_view/common_image_view.dart';
import 'package:e_learning_app/base/helper/avatar_helper.dart';

class DiceBearAvatarWidget extends StatelessWidget {
  const DiceBearAvatarWidget({
    super.key,
    this.userImageUrl,
    this.email,
    this.userId,
    this.fullName,
    this.size = 120,
    this.showEditIcon = false,
    this.onEditTap,
  });

  final String? userImageUrl;
  final String? email;
  final String? userId;
  final String? fullName;
  final double size;
  final bool showEditIcon;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = AvatarHelper.getAvatarUrl(
      userImageUrl: userImageUrl,
      email: email,
      userId: userId,
      fullName: fullName,
      size: size.toInt(),
    );

    if (showEditIcon) {
      return Stack(
        children: [
          CommonImageView.circle(
            imageUrl: avatarUrl,
            size: size,
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return CommonImageView.circle(
      imageUrl: avatarUrl,
      size: size,
    );
  }
}

