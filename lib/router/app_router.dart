import 'package:flutter/material.dart';
import 'package:trippo/features/map/presentation/pages/map_screen.dart';

import '../features/explore/presentation/pages/explore_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/plan/presentation/pages/plan_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../features/profile/presentation/pages/setting_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case PlanScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PlanScreen(),
        );
      case ExploreScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ExploreScreen(),
        );
      case MapScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      case SettingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
    }
  }
}
