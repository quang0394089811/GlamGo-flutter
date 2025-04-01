import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/home/home_controller.dart';
import 'package:project_shop/features/home/widget/infinite_carousel.dart';
import 'package:project_shop/features/products/widget/products_item_view.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';
import 'package:project_shop/widgets/inkwell/default_ink_well.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: Get.height * 0.32,
                      child: InfiniteCarousel(),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.onChangeIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex == index
                                      ? ColorName.black
                                      : ColorName.white,
                                  border: Border.all(color: ColorName.grey53),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                controller.categories[index],
                                style: Styles.normalTextW500(
                                  color: controller.selectedIndex == index
                                      ? ColorName.white
                                      : ColorName.black,
                                ),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 250,
                        ),
                        itemBuilder: (context, index) {
                          return ProductsItemView();
                        },),
                  ],
                ),
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, child: userInformation())
          ],
        ),
      ),
    );
  }

  Widget userInformation() {
    return Container(
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 18),
      padding: EdgeInsets.only(right: 18, left: 18),
      decoration: BoxDecoration(
          color: ColorName.grey16,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r))),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.avatar.path),
                fit: BoxFit.fill,
              ),
              color: Color(0xFFFFD88D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Hello Vanish',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8700000047683716),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcom ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: 'to Sense',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.grey53),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: DefaultInkWell(
                  onTap: () {},
                  child: IconWidget.ic24(path: Assets.icons.icSetting))),
          SizedBox(width: 8),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.grey53),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: DefaultInkWell(
                  onTap: () {},
                  child: IconWidget.ic24(path: Assets.icons.icSetting)))
        ],
      ),
    );
  }
}
