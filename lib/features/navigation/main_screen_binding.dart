import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:project_shop/features/home/home_controller.dart';
import 'package:project_shop/features/navigation/main_screen_controller.dart';
import 'package:project_shop/features/onboarding/onboarding_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>MainScreenController());
    Get.put(HomeController());
    Get.put(OnboardingController());
    // Get.lazyPut(()=> HomeController());
    // Get.lazyPut(()=>OnboardingController());
  }
}