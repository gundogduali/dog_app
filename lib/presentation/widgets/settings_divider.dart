import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.k16),
      child: Divider(
        indent: Sizes.k16,
        thickness: 2,
        color: AppColors.systemGray5Light,
      ),
    );
  }
}
