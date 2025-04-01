import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shop/configs/app_configs.dart';
import 'package:project_shop/data/api_service/api_service.dart';
import 'package:project_shop/data/base/dio_builder.dart';
import 'package:project_shop/data/secure_storage/secure_storage.dart';
import 'package:project_shop/widgets/common/toast_widget.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    AndroidOptions getAndroidOptions() => AndroidOptions(
          encryptedSharedPreferences: true,
        );
    Get.put<SecureStorage>(
      SecureStorage(
        FlutterSecureStorage(
          aOptions: getAndroidOptions(),
        ),
      ),
    );
    final dio = DioBuilder.build(Get.find());
    Get.put(ApiService(dio, baseUrl: AppConfigs.baseUrl));
    Get.put(ToastWidget());
  }
}
