import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:project_shop/features/cart/cart_binding.dart';
import 'package:project_shop/features/cart/cart_page.dart';
import 'package:project_shop/features/category/category_binding.dart';
import 'package:project_shop/features/category/category_page.dart';
import 'package:project_shop/features/home/home_binding.dart';
import 'package:project_shop/features/home/home_page.dart';
import 'package:project_shop/features/login/login_binding.dart';
import 'package:project_shop/features/login/login_page.dart';
import 'package:project_shop/features/navigation/main_screen_binding.dart';
import 'package:project_shop/features/navigation/main_screen.dart';
import 'package:project_shop/features/onboarding/onboarding_binding.dart';
import 'package:project_shop/features/onboarding/onboarding_page.dart';
import 'package:project_shop/features/splash/splash_binding.dart';
import 'package:project_shop/features/splash/splash_page.dart';
import 'package:project_shop/features/wishlist/wish_list_binding.dart';
import 'package:project_shop/features/wishlist/wish_list_page.dart';
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
      name: Routes.initPage,
      binding: MainScreenBinding(),
      page: () => MainScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
      // transition: Transition.cupertino,
      // transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: Routes.wishlist,
      binding: WishListBinding(),
      page: () => WishListPage(),
      // transition: Transition.cupertino,
      // transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: Routes.cart,
      binding: CartBinding(),
      page: () => CartPage(),
      // transition: Transition.cupertino,
      // transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: Routes.categories,
      binding: CategoryBinding(),
      page: () => CategoryPage(),
      // transition: Transition.cupertino,
      // transitionDuration: Duration(seconds: 1),
    ),
  ];
}
