import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project_shop/data/api_service/api_service.dart';
import 'package:project_shop/data/base/dio_builder.dart';
import 'package:project_shop/data/secure_storage/secure_storage.dart';

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
    Get.put(ApiService(dio));
  }
}
