import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:dog_app/presentation/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  factory AppTheme.light() {
    final theme = ThemeData.light();
    final textTheme = AppTextTheme(AppColors.labelLight).textTheme;
    return AppTheme._(
      mode: ThemeMode.light,
      data: theme.copyWith(
        primaryColor: AppColors.primary,
        textTheme: textTheme,
        scaffoldBackgroundColor: AppColors.systemBackgroundLight,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.systemBackgroundLight,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: textTheme.titleSmall,
        ),
      ),
    );
  }
  AppTheme._({
    required this.mode,
    required this.data,
  });
  final ThemeMode mode;
  final ThemeData data;
}
