import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/button/normal_button.dart';
import 'package:project_shop/widgets/common/common_switch.dart';
import 'package:project_shop/widgets/appbar_custom/custom_app_bar.dart';
import 'package:project_shop/widgets/simple_row_widget.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.22,
                color: ColorName.red5,
              ),
              SizedBox(
                height: 16.w,
              ),
              _cardSupport(),
              SizedBox(height: 16.w),
              _cardSecond(),
              SizedBox(
                height: 16.w,
              ),
              IButton.primaryNormal(
                contentPadding: EdgeInsets.symmetric(horizontal: 28.w),
                title: 'Đăng xuất'.tr,
                onPress: () {
                  // mainController?.logout();
                },
                iconFirst: Assets.icons.icLogout,
              ),
              SizedBox(
                height: 32.w,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardSupport() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('security'.tr, style: Styles.mediumTextW600()),
          SizedBox(height: 12.w),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
            widget: CommonSwitch(
              // value: controller.biometric,
              enableColor: ColorName.red5,
              disableColor: ColorName.grey34.withOpacity(0.16),
              onChanged: (value) {
                // controller.onSettingAccountBiometrics(
                //     isEnable: value);
              },
              width: 45.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardSecond() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('security'.tr, style: Styles.mediumTextW600()),
          SizedBox(height: 12.w),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
          SimpleRowWidget(
            contentFirst: 'passWord'.tr,
            onTap: () {},
            imageFirst: Assets.icons.icHome,
          ),
        ],
      ),
    );
  }
}
