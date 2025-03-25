import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';

class CategoryController extends BaseController {
  final List<String> categories = [
    "Tất cả",
    "Công nghệ",
    "Thể thao",
    "Âm nhạc",
    "Thời trang",
    "Du lịch"
  ];

  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;

  final _isSelected = false.obs;
  get isSelected => _isSelected.value;

  void onChangeIndex(int index){
    _selectedIndex.value = index;
    // selectedIndex.value = _isSelected.value;
  }
}
