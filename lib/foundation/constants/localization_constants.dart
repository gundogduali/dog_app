import 'package:flutter/material.dart';

class LocalizationConstants {
  LocalizationConstants._();
  static const String en = 'en';
  static const List<Locale> supportedLocales = [
    Locale(en),
  ];

  static const fallbackLocale = Locale(en);

  static const String path = 'assets/translations';
}
