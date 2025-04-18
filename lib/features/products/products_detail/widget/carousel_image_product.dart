import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/widgets/image_base/products_image_widget.dart';

class CarouselImageProduct extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageTap;
  final CarouselSliderController controller;

  const CarouselImageProduct({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: images.length,
          options: CarouselOptions(
            height: Get.height * 0.36,
            viewportFraction: 1,
            onPageChanged: (index, _) => onImageTap(index),
          ),
          itemBuilder: (context, index, realIndex) {
            return ProductsImageWidget(
              path: images[index],
              heightImage: Get.height * 0.36,
            );
          },
        ),
        Positioned(
          bottom: -35,
          left: 8,
          right: 8,
          child: SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () => onImageTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        images[index],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
