import 'package:flutter/material.dart';
import 'package:trippo/features/explore/presentation/pages/add_experince_screen.dart';
import '../features/plans/data/models/plan/plan_model.dart';
import '../features/plans/presentation/pages/plan_content_screen.dart';
import '../features/profile/presentation/pages/host_info_screen.dart';
import '../features/profile/presentation/pages/edit_profile_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

import '../features/authentication/presentation/screens/authentication_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/reset_password_screen.dart';
import '../features/city/presentation/screens/city_screen.dart';
import '../features/city/presentation/screens/questions_screen.dart';
import '../features/city/presentation/screens/show_question_screen.dart';
import '../features/explore/presentation/pages/experiences_detailes_screen.dart';
import '../features/home/data/models/cities_response.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/map/presentation/pages/map_screen.dart';
import '../features/place/presentation/pages/images_screen.dart';
import '../features/place/presentation/pages/place_screen.dart';
import '../features/place/presentation/pages/review_screen.dart';
import '../features/plan/presentation/pages/plan_screen.dart';
import '../features/plans/data/models/plan/plan_model.dart';
import '../features/plans/presentation/pages/plan_content_screen.dart';
import '../features/profile/presentation/pages/host_info_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../features/profile/presentation/pages/setting_screen.dart';
import '../features/search/presentation/pages/search_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );
      case PlanScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PlanScreen(),
          settings: routeSettings,
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
          settings: routeSettings,
        );
      case MapScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
          settings: routeSettings,
        );
      case SettingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
          settings: routeSettings,
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: routeSettings,
        );
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationScreen(),
          settings: routeSettings,
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
          settings: routeSettings,
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
          settings: routeSettings,
        );
      case PlaceScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PlaceScreen(
            arg: routeSettings.arguments as PlaceScreenParams,
          ),
          settings: routeSettings,
        );
      case ReviewsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ReviewsScreen(
            arg: routeSettings.arguments as ReviewsScreenParams,
          ),
          settings: routeSettings,
        );
      case EditProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case PlaceImagesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PlaceImagesScreen(
              arg: routeSettings.arguments as PlaceImagesScreenParams),
          settings: routeSettings,
        );
      case CityScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CityScreen(cityId: routeSettings.arguments as int),
          settings: routeSettings,
        );
      case QuestionsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => QuestionsScreen(
            city: routeSettings.arguments as CityModel,
          ),
          settings: routeSettings,
        );
      case ShowQuestionScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ShowQuestionScreen(
            params: routeSettings.arguments as ShowQuestionScreenParams,
          ),
          settings: routeSettings,
        );
      case ExperiencesDetailesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ExperiencesDetailesScreen(
            arg: routeSettings.arguments as ExperiencesDetailesScreenParams,
          ),
          settings: routeSettings,
        );
      case PlanContentScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PlanContentScreen(
            plan: routeSettings.arguments as PlanModel,
          ),
        );
      case HostInfoScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HostInfoScreen(),
        );
      case AddExperinceSrceen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AddExperinceSrceen(),
        );
    }
  }
}
