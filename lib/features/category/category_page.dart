import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/category/category_controller.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Expanded(
                child: Center(
                  child: Text(
                    "Bạn đã chọn: ${controller.categories[controller.selectedIndex]}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
    // Center(
    //   child: Text('Category Page'),
    // ),
    // );
  }
}
