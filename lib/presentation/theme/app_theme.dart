import 'package:dog_app/foundation/constants/size_constants.dart';
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
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          hintStyle: textTheme.bodyMedium?.copyWith(
            color: AppColors.secondaryLabelLight,
          ),
          fillColor: AppColors.systemBackgroundLight,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.systemGray5Light,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.k8),
            ),
          ),
          focusedBorder: InputBorder.none,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.k8),
            ),
            elevation: 0,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.systemBackgroundLight,
            ),
            minimumSize: const Size(double.infinity, Sizes.k56),
          ),
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
