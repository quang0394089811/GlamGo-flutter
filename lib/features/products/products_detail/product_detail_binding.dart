import 'package:get/get.dart';
import 'package:project_shop/features/products/products_detail/product_detail_controller.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController());
  }
}