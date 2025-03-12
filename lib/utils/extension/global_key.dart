import 'package:flutter/material.dart';

extension GlobalKeyEx on GlobalKey {
  Future<void> ensureVisibleOnTextArea() async {
    final keyContext = currentContext;
    if (keyContext != null) {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        ),
      );
      // Optional if doesnt work with the first
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        ),
      );
    }
  }
}


extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
