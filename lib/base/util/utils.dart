import 'package:project_shop/configs/app_configs.dart';
import 'package:project_shop/utils/extension/extension.dart';

class Utils {
  Utils._();
  static final I = Utils._();
    bool isValidEmail(String email) {
    if (isNullOrEmpty) return false;
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
    String getImageFullPath(String imagePath) {
    return AppConfigs.hostUrl + imagePath;
  }
}
