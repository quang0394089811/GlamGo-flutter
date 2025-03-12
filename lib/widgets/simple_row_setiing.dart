import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/generated/colors.gen.dart';
import 'package:project_shop/utils/extension/extension.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';
import 'package:project_shop/widgets/inkwell/default_ink_well.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class SimpleRowSetting extends StatelessWidget{
  const SimpleRowSetting({
    super.key,
    this.shape,
    this.imageFirst,
    this.imageSecond,
    this.contentFirst,
    this.onTap,
    this.styleContent,
    this.crossAxisAlignment,
    this.color,
    this.mainAxisAlignment,
    this.contentSecond,
    this.styleContentSecond,
    this.widget,
    this.isShowWidget = true,
    this.padding,
    this.disableOnclick = false,
    this.icText,
    this.textAlign,
    this.isWidthSizeBox,
    this.isUseSvg = true,
    this.pngPath = "",
  });

  final ShapeBorder? shape;
  final String? imageFirst, imageSecond;
  final String? contentFirst, contentSecond;
  final GestureTapCallback? onTap;
  final TextStyle? styleContent, styleContentSecond;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? widget;
  final bool isShowWidget;
  final double? padding;
  final bool disableOnclick;
  final Widget? icText;
  final TextAlign? textAlign;
  final double? isWidthSizeBox;
  final bool isUseSvg;
  final String pngPath;

  @override
  Widget build(BuildContext context) {
    return DefaultInkWell(
      onTap: onTap,
      enabled: !disableOnclick,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: padding ?? 12.w, horizontal: 4.w),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            isUseSvg
                ? imageFirst.isNullOrEmpty
                    ? const SizedBox()
                    : SvgPicture.asset(
                        imageFirst ?? '',
                        color: color ?? ColorName.textLinkColor,
                        fit: BoxFit.scaleDown,
                        // width: 24.1.w,
                        // height: 24.1.w,
                      )
                : pngPath.isNullOrEmpty
                    ? const SizedBox()
                    : Image.asset(
                        pngPath,
                        fit: BoxFit.scaleDown,
                        width: 24.w,
                        height: 24.w,
                      ),
            SizedBox(
              width: isWidthSizeBox ?? 12.h,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      contentFirst.orDash,
                      style: styleContent ??
                          Styles.normalText(
                            color: ColorName.blue17,
                          ),
                      textAlign: textAlign ?? TextAlign.justify,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  icText ?? const SizedBox(),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  contentSecond ?? '',
                  style: Styles.normalText(
                    color: ColorName.grey9,
                  ),
                ),
                SizedBox(
                  width: contentSecond == null ? 0 : 8.w,
                ),
                isShowWidget
                    ? widget ??
                        IconWidget.ic24(
                            path: Assets.icons.icArrowRightNew, color: color)
                    : const SizedBox(),
                // imageSecond.isEmptyOrNull
                //     ? const SizedBox()
                //     : IconWidget.ic16(
                //         path: Assets.icons.icArrowRightNew, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
