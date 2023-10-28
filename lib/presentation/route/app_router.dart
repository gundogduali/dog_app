import 'package:auto_route/auto_route.dart';
import 'package:dog_app/presentation/pages/dashboard_screen/dashboard_screen.dart';
import 'package:dog_app/presentation/pages/home/home_screen.dart';
import 'package:dog_app/presentation/pages/settings_screen/settings_screen.dart';
import 'package:dog_app/presentation/pages/splash_screen/splash_screen.dart';
import 'package:dog_app/presentation/route/route_paths.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          path: RoutePaths.splash,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: RoutePaths.dashboard,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: RoutePaths.home,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: RoutePaths.settings,
            ),
          ],
        ),
      ];
}
