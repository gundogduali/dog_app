import 'package:dog_app/core/services/device_info_service.dart';
import 'package:dog_app/di/di.dart';
import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VersionTextWidget extends StatelessWidget {
  const VersionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getIt<DeviceInfoService>().getVersion(),
      builder: (context, snapshot) {
        return Text(
          snapshot.hasData ? snapshot.data! : '-',
          style: context.textTheme.displaySmall?.copyWith(
            color: AppColors.secondaryLabelLight,
          ),
        );
      },
    );
  }
}
