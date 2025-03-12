import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void animateToTop() {
    if (hasClients) {
      animateTo(
        0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.ease,
      );
    }
  }
}
