import 'package:dog_app/di/di.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/bloc/breed/breed_bloc.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:dog_app/presentation/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BreedBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => LocaleKeys.appName.translate,
        routerConfig: getIt<AppRouter>().config(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: AppTheme.light().data,
        themeMode: AppTheme.light().mode,
      ),
    );
  }
}
