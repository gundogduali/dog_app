import 'dart:async';

import 'package:dog_app/app.dart';
import 'package:dog_app/di/di.dart' as di;
import 'package:dog_app/foundation/constants/localization_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      di.setup();
      EasyLocalization.logger.enableBuildModes = [];
      runApp(
        EasyLocalization(
          supportedLocales: LocalizationConstants.supportedLocales,
          path: LocalizationConstants.path,
          fallbackLocale: LocalizationConstants.fallbackLocale,
          useOnlyLangCode: true,
          child: const App(),
        ),
      );
    },
    (error, stack) {
      //TODO: Add logger
    },
  );
}
