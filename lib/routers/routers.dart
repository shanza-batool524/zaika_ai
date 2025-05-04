import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zaika_ai/routers/router_names.dart';
import 'package:zaika_ai/views/dashboard/dashboard_screen.dart';

import '../views/add/add_view.dart';
import '../views/authentication/login_screen.dart';

import '../views/authentication/signup_screen.dart';
import '../views/onboarding/onboarding_screen_one.dart';
import '../views/onboarding/onboarding_screen_three.dart';
import '../views/onboarding/onboarding_screen_two.dart';
import '../views/recipes/recipe_ingredients_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static appRoute() => [
    GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RouteName.onBoardingScreenOne,
      page: () => const OnboardingScreenOne(),
    ),
    GetPage(
      name: RouteName.onBoardingScreenTwo,
      page: () => const OnboardingScreenTwo(),
    ),
    GetPage(
      name: RouteName.onBoardingScreenThree,
      page: () => const OnboardingScreenThree(),
    ),
    GetPage(name: RouteName.signupScreen, page: () => const SignupScreen()),
    GetPage(name: RouteName.loginScreen, page: () => const LoginScreen()),
    GetPage(name: RouteName.dashboardScreen, page: () => const DashboardScreen()),
    GetPage(name: RouteName.addView, page: () =>  AddView()),
    GetPage(name: RouteName.recipeIngredientsScreen, page: () =>  RecipeIngredientsScreen()),
  ];
}
