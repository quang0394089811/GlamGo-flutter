import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/routes/app_routes.dart';

class SplashController extends BaseController with GetTickerProviderStateMixin {
  Rx<double> loadingProgress = 0.0.obs;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  Timer? _prosesTimer;

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

    startLoadingProgress();

    animationController.forward();
    Timer(
      const Duration(seconds: 4),
      () {
        if (!isClosed) {
          Get.toNamed(Routes.home);
        }
      },
    );
  }

  void startLoadingProgress() {
    const totalSteps = 100;
    const stepsDuration = Duration(milliseconds: 30);
    _prosesTimer = Timer.periodic(stepsDuration, (timer) {
      if (loadingProgress < 1.0) {
        loadingProgress += 1 / totalSteps;
      } else {
        _prosesTimer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    _prosesTimer?.cancel();
  }
}
