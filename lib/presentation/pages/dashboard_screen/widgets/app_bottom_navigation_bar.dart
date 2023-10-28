import 'dart:developer';

import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/components/app_divider.dart';
import 'package:dog_app/presentation/pages/dashboard_screen/widgets/bottom_navigation_bar_painter.dart';
import 'package:dog_app/presentation/theme/app_icons.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    inspect(context.theme);
    return SizedBox(
      height: 98,
      child: CustomPaint(
        painter: BottomNavigationBarPainter(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(bottom: context.mediaQuery.padding.bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AppBottomNavigationBarItem(
                label: LocaleKeys.home.translate,
                onTap: () => onTap?.call(0),
                icon: AppIcons.home,
                isSelected: currentIndex == 0,
                selectedColor: context.theme.primaryColor,
                unselectedColor: context.theme.colorScheme.scrim,
              ),
              const AppDividerVertical(),
              _AppBottomNavigationBarItem(
                label: LocaleKeys.settings.translate,
                onTap: () => onTap?.call(1),
                icon: AppIcons.settings,
                isSelected: currentIndex == 1,
                selectedColor: context.theme.primaryColor,
                unselectedColor: context.theme.colorScheme.scrim,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBottomNavigationBarItem extends StatelessWidget {
  const _AppBottomNavigationBarItem({
    required this.label,
    required this.onTap,
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
  });
  final String label;
  final VoidCallback? onTap;
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? selectedColor : unselectedColor,
              size: 32,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isSelected ? selectedColor : unselectedColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
