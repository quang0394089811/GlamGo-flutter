import 'package:get/get.dart';
import 'package:project_shop/base/app_exception.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/data/api_service/api_service.dart';
import 'package:project_shop/data/repository/categories_action/categories_repository.dart';
import 'package:project_shop/data/response_models/categories/category_model.dart';

class CategoryController extends BaseController {
  final _categoriesRepository = Get.find<CategoriesRepository>();
  final List<String> categories = [
    "Tất cả",
    "Công nghệ",
    "Thể thao",
    "Âm nhạc",
    "Thời trang",
    "Du lịch"
  ];

  final RxList<CategoryModel> _listCategories = <CategoryModel>[].obs;
  List<CategoryModel> get listCategories => _listCategories;

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  final _isSelected = false.obs;
  bool get isSelected => _isSelected.value;

  @override
  final RxBool isLoading = false.obs;

  final ApiService _apiService = Get.find();

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void onChangeIndex(int index) {
    _selectedIndex.value = index;
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    try {
      final response = await _categoriesRepository.getCategories();
      response.fold(
        (error) {
          appException.value = error;
          isLoading.value = false;
        },
        (data) {
          _listCategories.assignAll(data.data);
          isLoading.value = false;
        },
      );
    } catch (e) {
      appException.value = AppException(message: e.toString());
      isLoading.value = false;
    }
  }
}
