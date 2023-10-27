import 'dart:async';

import 'package:dog_app/app.dart';
import 'package:dog_app/di/di.dart' as di;
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      di.setup();
      runApp(const App());
    },
    (error, stack) {
      //TODO: Add logger
    },
  );
}
