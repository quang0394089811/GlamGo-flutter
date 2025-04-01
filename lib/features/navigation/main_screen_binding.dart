import 'package:get/get.dart';
import 'package:project_shop/data/repository/categories_action/categories_repository.dart';
import 'package:project_shop/features/category/category_controller.dart';
import 'package:project_shop/features/home/home_controller.dart';
import 'package:project_shop/features/navigation/main_screen_controller.dart';
import 'package:project_shop/features/onboarding/onboarding_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
    Get.put(HomeController());
    Get.put(OnboardingController());
    // Get.put(CategoryController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(()=>CategoriesRepository());
    // Get.lazyPut(()=>OnboardingController());
  }
}
