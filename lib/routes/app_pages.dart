import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_shop/features/home/home_binding.dart';
import 'package:project_shop/features/home/home_page.dart';
import 'package:project_shop/features/login/login_binding.dart';
import 'package:project_shop/features/login/login_page.dart';
import 'package:project_shop/features/onboarding/onboarding_binding.dart';
import 'package:project_shop/features/onboarding/onboarding_page.dart';
import 'package:project_shop/features/splash/splash_binding.dart';
import 'package:project_shop/features/splash/splash_page.dart';
import 'package:project_shop/routes/app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.splash,
      binding: SplashBinding(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.onboarding,
      binding: OnboardingBinding(),
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
