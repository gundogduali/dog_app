import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDividerVertical extends StatelessWidget {
  const AppDividerVertical({super.key, this.height = 24});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 2,
      decoration: BoxDecoration(
        color: AppColors.systemGray4Light,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
