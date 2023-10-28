import 'package:easy_localization/easy_localization.dart';

extension StringExtensions on String {
  String get translate => this.tr();

  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';
}
