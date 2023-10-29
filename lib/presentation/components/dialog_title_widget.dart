import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DialogTitleWidget extends StatelessWidget {
  const DialogTitleWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.theme.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.k8),
          child: Divider(
            color: AppColors.systemGray6Light,
          ),
        ),
      ],
    );
  }
}
