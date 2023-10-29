import 'package:auto_route/auto_route.dart';
import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/theme/app_icons.dart';
import 'package:dog_app/presentation/widgets/settings_divider.dart';
import 'package:dog_app/presentation/widgets/settings_tile.dart';
import 'package:dog_app/presentation/widgets/version_text_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: Sizes.k48),
            child: Column(
              children: [
                SettingsTile(icon: AppIcons.info, title: LocaleKeys.help),
                SettingsDivider(),
                SettingsTile(
                  icon: AppIcons.rate,
                  title: LocaleKeys.rateUs,
                ),
                SettingsDivider(),
                SettingsTile(
                  icon: AppIcons.share,
                  title: LocaleKeys.shareWithFriends,
                ),
                SettingsDivider(),
                SettingsTile(
                  icon: AppIcons.termsofuse,
                  title: LocaleKeys.termsOfUse,
                ),
                SettingsDivider(),
                SettingsTile(
                  icon: AppIcons.privacypolicy,
                  title: LocaleKeys.privacyPolicy,
                ),
                SettingsDivider(),
                SettingsTile(
                  icon: AppIcons.version,
                  title: LocaleKeys.osVersion,
                  trailing: VersionTextWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
