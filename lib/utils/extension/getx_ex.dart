import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

extension BaseGet on GetInterface {
  T? safeFind<T>({String? tag}) {
    try {
      return Get.find<T>(tag: tag);
    } catch (e) {
      debugPrint("GET_SAFE_FIND_ERROR: $e");
      return null;
    }
  }
}
