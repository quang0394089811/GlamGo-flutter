import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  factory IconWidget.ic80(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 80,
        height: 80,
        noTintColor: noTintColor ?? true,
      );

  factory IconWidget.ic48(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 48,
        height: 48,
        noTintColor: noTintColor ?? true,
      );

  factory IconWidget.ic40(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 40,
        height: 40,
        noTintColor: noTintColor ?? true,
      );

  factory IconWidget.ic36(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 36,
        height: 36,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic32(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 32,
        height: 32,
        noTintColor: noTintColor,
      );

  factory IconWidget.ic30(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 30,
        height: 30,
        noTintColor: noTintColor,
      );

  factory IconWidget.ic20(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 20,
        height: 20,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic28(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 28,
        height: 28,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic26(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 26,
        height: 26,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic24(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 24,
        height: 24,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic18(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 18,
        height: 18,
        noTintColor: noTintColor ?? true,
      );

  factory IconWidget.ic16(
          {required String path,
          Color? color,
          bool? noTintColor,
          BoxFit fit = BoxFit.contain}) =>
      IconWidget(
        path: path,
        color: color,
        width: 16,
        height: 16,
        noTintColor: noTintColor ?? true,
        fit: fit,
      );

  factory IconWidget.ic12(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 12,
        height: 12,
        noTintColor: noTintColor ?? true,
      );

  factory IconWidget.ic8(
          {required String path, Color? color, bool? noTintColor}) =>
      IconWidget(
        path: path,
        color: color,
        width: 8,
        height: 8,
        noTintColor: noTintColor ?? true,
      );
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final Color? lmColor;
  final bool? noTintColor;
  final BoxFit fit;

  const IconWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.lmColor,
    this.noTintColor,
    this.fit = BoxFit.contain,
  });

  Color? get tintColor {
    if (color != null) {
      return color;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String realPath = path;

    return SvgPicture.asset(
      color: color,
      realPath,
      height: width,
      width: height,
      fit: fit,
    );
  }
}
