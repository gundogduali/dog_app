import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.onRetry,
    required this.errorMessage,
    super.key,
  });
  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onRetry,
          child: Text(LocaleKeys.retry.translate),
        ),
      ],
    );
  }
}
