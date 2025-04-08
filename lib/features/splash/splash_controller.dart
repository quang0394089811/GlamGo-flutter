import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/data/secure_storage/share_preference_manager.dart';
import 'package:project_shop/routes/app_routes.dart';
import 'package:project_shop/utils/constant.dart';

class SplashController extends BaseController with GetTickerProviderStateMixin {
  Rx<double> loadingProgress = 0.0.obs;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  Timer? _prosesTimer;

  final SharedPreferencesManager sharedPreferencesManager = Get.find();

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    animationController.forward();

    startLoadingProgress();
  }

  void checkFirstTime() {
    bool isFirstTime =
        sharedPreferencesManager.getBool(Constant.KEY_FIRST_SHOW_ONBOARDING) ??
            true;

    if (isFirstTime) {
      Get.toNamed(Routes.onboarding);
    } else {
      Get.toNamed(Routes.initPage);
    }
  }

  void startLoadingProgress() {
    const totalSteps = 100;
    const stepsDuration = Duration(milliseconds: 30);

    _prosesTimer = Timer.periodic(
      stepsDuration,
      (timer) {
        if (loadingProgress < 1.0) {
          loadingProgress += 1 / totalSteps;
        } else {
          _prosesTimer?.cancel();
          if (!isClosed) {
            checkFirstTime();
          }
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    _prosesTimer?.cancel();
  }
}
