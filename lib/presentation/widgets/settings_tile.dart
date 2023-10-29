import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:dog_app/presentation/theme/app_icons.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    super.key,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.k16),
        child: Row(
          children: [
            Icon(
              icon,
              color: context.theme.colorScheme.scrim,
              size: Sizes.k32,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.k8),
                child: Text(
                  title.translate,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ),
            trailing ??
                const Icon(
                  AppIcons.arrowupright,
                  color: AppColors.systemGray3Light,
                  size: Sizes.k16,
                ),
          ],
        ),
      ),
    );
  }
}
