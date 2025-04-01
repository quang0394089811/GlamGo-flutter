import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/category/category_controller.dart';
import 'package:project_shop/features/products/widget/products_item_view.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 4),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listCategories.length,
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
                          controller.listCategories[index].name ?? 'N/A',
                          // controller.categories[index],
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
              Text(
                controller.listCategories.isNotEmpty
                    ? "Bạn đã chọn: ${controller.listCategories[controller.selectedIndex].name}"
                    : "Không có danh mục nào",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (context, index) {
                    return ProductsItemView();
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
