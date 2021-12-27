import 'package:flutter/material.dart';

import 'core/theme_app.dart';
import 'features/explore/presentation/pages/explore_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/main/presentation/pages/main_screen.dart';
import 'features/plan/presentation/pages/plan_screen.dart';
import 'features/profile/presentation/pages/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tripo',
      theme: ThemeApp().getTheme(),
      home: const MainScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        PlanScreen.routeName: (context) => const PlanScreen(),
        ExploreScreen.routeName: (context) => const ExploreScreen(),
        ProfileScreenn.routeName: (context) => const ProfileScreenn(),
      },
    );
  }
}
