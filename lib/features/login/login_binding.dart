import 'package:get/get.dart';
import 'package:project_shop/features/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
  
}