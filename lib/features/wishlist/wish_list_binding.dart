import 'package:get/get.dart';
import 'package:project_shop/features/wishlist/wish_list_controller.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishListController());
  }
}