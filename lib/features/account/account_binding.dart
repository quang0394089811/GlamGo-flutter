import 'package:get/get.dart';
import 'package:project_shop/features/account/account_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> AccountController());
  }
}