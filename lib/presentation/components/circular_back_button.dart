import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CircularBackButton extends StatelessWidget {
  const CircularBackButton({super.key, this.onTap, this.padding});
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? context.router.pop,
      child: Container(
        width: Sizes.k32,
        height: Sizes.k32,
        margin: padding,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          size: Sizes.k16,
          color: AppColors.black,
        ),
      ),
    );
  }
}
