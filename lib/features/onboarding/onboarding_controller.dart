import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/utils/extension/getx_ex.dart';
import 'package:project_shop/widgets/appbar_custom/common_snackbar.dart';
import 'package:project_shop/widgets/common/toast_widget.dart';

class OnboardingController extends BaseController {

  void onPressCheckSnackbar() {
    Get.safeFind<ToastWidget>()?.showToast(Get.context!,
        toastStatus: ToastStatus.warning, title: '', description: 'Check');
  }
}
