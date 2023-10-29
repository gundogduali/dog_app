import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.noResultFound.translate,
            style: context.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Sizes.k16),
          Text(
            LocaleKeys.trySearchingAnotherWord.translate,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.secondaryLabelLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
