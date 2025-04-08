import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_shop/features/home/home_controller.dart';

class InfiniteCarousel extends GetView<HomeController> {
  const InfiniteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items:
                    List.generate(controller.listImgCarousel.length, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      controller.listImgCarousel[index],
                      fit: BoxFit.cover,
                      height: Get.height,
                      width: Get.width,
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: Get.height * 0.28,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    controller.jumpToPage(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(controller.listImgCarousel.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: controller.currentIndex == index ? 8 : 4,
                    height: controller.currentIndex == index ? 8 : 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex == index
                          ? Colors.red
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
