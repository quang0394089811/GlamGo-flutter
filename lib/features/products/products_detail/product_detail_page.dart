import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/products/products_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Product Detail Page'),
        ),
      ),
    );
  }
}