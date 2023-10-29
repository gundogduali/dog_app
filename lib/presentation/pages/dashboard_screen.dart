import 'package:auto_route/auto_route.dart';
import 'package:dog_app/presentation/route/app_router.dart';
import 'package:dog_app/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomNavigationBar(
          onTap: tabsRouter.setActiveIndex,
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}
