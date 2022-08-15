import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/authentication_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/reset_password_screen.dart';
import '../features/city/presentation/screens/city_screen.dart';
import '../features/city/presentation/widgets/questions_screen.dart';
import '../features/city/presentation/widgets/show_question_screen.dart';
import '../features/explore/presentation/pages/search_screen.dart';
import '../features/home/data/models/cities_response.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/map/presentation/pages/map_screen.dart';
import '../features/place/presentation/pages/images_screen.dart';
import '../features/place/presentation/pages/place_screen.dart';
import '../features/place/presentation/pages/review_screen.dart';
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
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
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
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationScreen(),
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      case PlaceScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PlaceScreen(
            arg: routeSettings.arguments as PlaceScreenParams,
          ),
        );
      case ReviewsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ReviewsScreen(
            arg: routeSettings.arguments as ReviewsScreenParams,
          ),
        );
      case PlaceImagesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PlaceImagesScreen(
              arg: routeSettings.arguments as PlaceImagesScreenParams),
        );
      case CityScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => CityScreen(cityId: routeSettings.arguments as int));
      case QuestionsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => QuestionsScreen(
                  city: routeSettings.arguments as CityModel,
                ));
      case ShowQuestionScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ShowQuestionScreen(
            params: routeSettings.arguments as ShowQuestionScreenParams,
          ),
        );
    }
  }
}
