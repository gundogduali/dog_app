import 'package:dog_app/di/di.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => LocaleKeys.appName.translate,
      routerConfig: getIt<AppRouter>().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
