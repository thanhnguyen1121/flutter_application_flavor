import 'package:build_flavor/utils/app_colors.dart';
import 'package:build_flavor/utils/app_theme_state_extension.dart';
import 'package:flutter/cupertino.dart';
class AppGradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const AppGradientButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [
              AppColors.colorEB2227,
              AppColors.color8B1F17,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Text(
          title,
          style: context.appTheme.body14B.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
