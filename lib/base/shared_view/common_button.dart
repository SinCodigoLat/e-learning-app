import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/base/constants/ui/app_colors.dart';
import 'package:flutter_bloc_template/base/constants/ui/app_text_styles.dart';

enum CommonButtonSize { small, medium, large }

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.size = CommonButtonSize.medium,
    this.enable = true,
    this.fullWidth = false,
    this.backgroundColor,
  });

  final String title;
  final VoidCallback onPressed;
  final CommonButtonSize size;
  final bool enable;
  final bool fullWidth;
  final Color? backgroundColor;

  // factory CommonButton.small({
  //   required String title,
  //   bool enable = true,
  //   required VoidCallback onPressed,
  // }) {
  //   return CommonButton(
  //     title: title,
  //     size: CommonButtonSize.small,
  //     enable: enable,
  //     onPressed: onPressed,
  //   );
  // }
  //
  // factory CommonButton.large({
  //   required String title,
  //   bool enable = true,
  //   required VoidCallback onPressed,
  // }) {
  //   return CommonButton(
  //     title: title,
  //     size: CommonButtonSize.large,
  //     enable: enable,
  //     onPressed: onPressed,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final child = DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
        BoxShadow(
          offset: const Offset(4, 8),
          blurRadius: 24,
          color: AppColors.current.primary500.withOpacity(.25),
        ),
      ]),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: _backgroundColor(),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        // style: ButtonStyle(
        //   backgroundColor: WidgetStateProperty.all(_backgroundColor()),
        //   padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 18, horizontal: 16)),
        //   shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        // ),
        child: Text(
          title,
          style: AppTextStyles.bodyLargeBold.copyWith(color: _getTitleColor()),
        ),
      ),
    );
    return fullWidth ? ConstrainedBox(constraints: BoxConstraints(minWidth: double.infinity), child: child) : child;
  }

  Color _backgroundColor() {
    if (!enable) return AppColors.current.disable;
    return backgroundColor ?? AppColors.current.primary500;
  }

  Color _getTitleColor() {
    if (enable) return AppColors.current.otherWhite;
    return AppColors.current.primary500;
  }
}
