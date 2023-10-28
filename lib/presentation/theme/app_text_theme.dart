import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  factory AppTextTheme(Color color) {
    return AppTextTheme._(
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: Sizes.k20,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        bodyMedium: TextStyle(
          fontFamily: _fontFamily,
          fontSize: Sizes.k16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        bodySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: Sizes.k11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontSize: Sizes.k13,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  const AppTextTheme._({
    required this.textTheme,
  });
  static const _fontFamily = 'GalanoGrotesque';
  final TextTheme textTheme;
}
