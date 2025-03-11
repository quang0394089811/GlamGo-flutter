import 'package:get/get.dart';
import 'package:project_shop/base/app_exception.dart';

class BaseController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<AppException?> appException = Rx<AppException?>(null);

  @override
  void onInit() {
    ever(appException, (AppException? exception) {
      Get.snackbar('Error', exception?.message ?? '');
    });
    super.onInit();
  }
}
