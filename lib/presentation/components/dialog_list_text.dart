import 'package:dog_app/foundation/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class DialogListText extends StatelessWidget {
  const DialogListText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}
