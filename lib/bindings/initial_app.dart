import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shop/configs/app_configs.dart';
import 'package:project_shop/data/api_service/api_service.dart';
import 'package:project_shop/data/base/dio_builder.dart';
import 'package:project_shop/data/secure_storage/secure_storage.dart';
import 'package:project_shop/data/secure_storage/share_preference_manager.dart';
import 'package:project_shop/widgets/common/toast_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  static Future<void> init() async {
    // 1. SharedPreferencesManager
  final prefs = await SharedPreferences.getInstance();
  Get.put(SharedPreferencesManager(sharedPreferences: prefs));

    // 2. SecureStorage
    AndroidOptions getAndroidOptions() => AndroidOptions(encryptedSharedPreferences: true);
    Get.put<SecureStorage>(
      SecureStorage(
        FlutterSecureStorage(aOptions: getAndroidOptions()),
      ),
    );

    // 3. ApiService (cần SecureStorage)
    final dio = DioBuilder.build(Get.find<SecureStorage>());
    Get.put(ApiService(dio, baseUrl: AppConfigs.baseUrl));

    // 4. ToastWidget
    Get.put(ToastWidget());
  }
}