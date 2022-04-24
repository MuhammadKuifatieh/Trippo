import 'package:flutter/material.dart';
import 'package:trippo/features/authentication/presentation/screens/authentication_screen.dart';

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
      case SettingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationScreen(),
        );
    }
  }
}
