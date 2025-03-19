import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/gen/fonts.gen.dart';

class Styles {
  static TextStyle getTextStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    String fontFamily = FontFamily.inter,
  }) =>
      Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ) ??
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      );

  // Small text styles
  static TextStyle smallText({
    Color? color,
    String fontFamily = FontFamily.inter,
  }) =>
      getTextStyle(
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily,
      );

  static TextStyle smallTextW500({
    Color? color,
    String fontFamily = FontFamily.inter,
  }) =>
      getTextStyle(
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle smallTextW700({
    Color? color,
    double? fontSize,
    String fontFamily = FontFamily.inter,
  }) =>
      getTextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      );

  static TextStyle smallTextW900({
    Color? color,
    String fontFamily = FontFamily.inter,
  }) =>
      getTextStyle(
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily,
      );
  static TextStyle getNormalStyle(color, double font, fontWeight,
          {TextDecoration? decoration}) =>
      Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          decoration: decoration,
          fontFamily: FontFamily.inter) ??
      TextStyle(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          decoration: decoration,
          fontFamily: FontFamily.inter);

  static TextStyle normalText(
          {Color? color,
          double? size,
          FontWeight? fontWeight,
          TextDecoration? decoration}) =>
      getNormalStyle(
        color,
        size ?? 14.sp,
        fontWeight ?? FontWeight.w500,
        decoration: decoration,
      );

  static TextStyle normalTextW400({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w400);

  static TextStyle normalTextW500({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w500);

  static TextStyle normalTextW600({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w600);

  static TextStyle normalTextW700({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w700);

  static TextStyle normalTextW800({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w800);

  static TextStyle normalTextW900({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.w900);

  static TextStyle normalTextBold({Color? color, double? size}) =>
      getNormalStyle(color, size ?? 14.sp, FontWeight.bold);

  //Medium.
  static TextStyle getMediumStyle(color, double font, fontWeight) =>
      Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter) ??
      TextStyle(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter);

  static TextStyle mediumText({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.normal);

  static TextStyle mediumTextW500({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.w500);

  static TextStyle mediumTextW600({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.w600);

  static TextStyle mediumTextW700({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.w700);

  static TextStyle mediumTextW800({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.w800);

  static TextStyle mediumTextW900({Color? color}) =>
      getMediumStyle(color, 16.sp, FontWeight.w900);

  static TextStyle mediumText18({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.normal);

  static TextStyle mediumText18W500({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.w500);

  static TextStyle mediumText18W600({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.w600);

  static TextStyle mediumText18W700({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.w700);

  static TextStyle mediumText18W800({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.w800);

  static TextStyle mediumText18W900({Color? color}) =>
      getMediumStyle(color, 18.sp, FontWeight.w900);

  static TextStyle buttonTextStyle({Color? color = Colors.white}) =>
      getMediumStyle(color, 14.sp, FontWeight.normal);

  static TextStyle disableButtonTextStyle({Color? color = Colors.grey}) =>
      getMediumStyle(color, 14.sp, FontWeight.normal);

  //Big.
  static TextStyle getBigStyle(color, double font, fontWeight) =>
      Theme.of(Get.context!).textTheme.titleLarge?.copyWith(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter) ??
      TextStyle(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter);

  static TextStyle bigText({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.normal);

  static TextStyle bigTextW500({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.w500);

  static TextStyle bigTextW600({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.w600);

  static TextStyle bigTextW700({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.w700);

  static TextStyle bigTextW800({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.w800);

  static TextStyle bigTextW900({Color? color}) =>
      getBigStyle(color, 20.sp, FontWeight.w900);

  static TextStyle getHugeStyle(color, double font, fontWeight) =>
      Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter) ??
      TextStyle(
          color: color,
          fontSize: font,
          fontWeight: fontWeight,
          fontFamily: FontFamily.inter);

  static TextStyle hugeText({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.normal);

  static TextStyle hugeTextW500({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.w500);

  static TextStyle hugeTextW600({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.w600);

  static TextStyle hugeTextW700({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.w700);

  static TextStyle hugeTextW800({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.w800);

  static TextStyle hugeTextW900({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.w900);

  static TextStyle hugeTextBold({Color? color}) =>
      getHugeStyle(color, 24.sp, FontWeight.bold);

  static TextStyle textError() =>
      TextStyle(fontSize: 12.sp, color: ColorName.red5);

  static TextStyle textMassive({double? fontSize}) => TextStyle(
        fontSize: fontSize ?? 30.sp,
        color: ColorName.white,
      );

  static TextStyle textMassiveW600({double? fontSize}) => TextStyle(
        fontSize: fontSize ?? 30.sp,
        color: ColorName.white,
        fontWeight: FontWeight.w600,
      );

  static TextStyle textUnderline({
    Color? color,
    double? size,
    FontWeight fWeight = FontWeight.w500,
  }) =>
      TextStyle(
          color: color,
          fontSize: size ?? 14.sp,
          fontWeight: fWeight,
          decoration: TextDecoration.underline,
          fontFamily: FontFamily.inter);

  ///italic text
  static TextStyle italicText(
          {Color? color,
          double? size,
          FontWeight fWeight = FontWeight.w500,
          TextDecoration decoration = TextDecoration.underline}) =>
      TextStyle(
          color: color,
          fontSize: size ?? 14.sp,
          fontWeight: fWeight,
          fontStyle: FontStyle.italic,
          decoration: decoration,
          fontFamily: FontFamily.inter);

  static TextStyle italicTextW500({
    Color? color,
    double? size,
    FontWeight fWeight = FontWeight.w500,
  }) =>
      TextStyle(
          color: color,
          fontSize: size ?? 14.sp,
          fontWeight: fWeight,
          fontStyle: FontStyle.italic,
          fontFamily: FontFamily.inter);
}
