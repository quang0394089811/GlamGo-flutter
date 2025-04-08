import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/app_exception.dart';
import 'package:project_shop/data/api_service/api_service.dart';
import 'package:project_shop/data/base/base_response_model.dart';
import 'package:project_shop/data/response_models/categories/category_model.dart';
import 'package:project_shop/data/response_models/products/products_model.dart';
import 'package:project_shop/utils/extension/extension.dart';

abstract class ICategoriesRepository {
  Future<Either<AppException, BaseResponseModel<CategoryModel>>>
      getCategories();

  Future<Either<AppException, BaseResponseModel<ProductsModel>>> getProducts();

  Future<Either<AppException, BaseResponseModel<ProductsModel>>>
      getProductsByCategory(int? categoryId);
}

class CategoriesRepository implements ICategoriesRepository {
  final ApiService _apiService = Get.find();

  @override
  Future<Either<AppException, BaseResponseModel<CategoryModel>>>
      getCategories() async {
    try {
      final response = await _apiService.getCategories();
      if (response.data.isNullOrEmpty) {
        return Left(AppException(message: 'Data is empty'));
      }
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, BaseResponseModel<ProductsModel>>>
      getProducts() async {
    try {
      final response = await _apiService.getProducts();
      if (response.data.isNullOrEmpty) {
        return Left(AppException(message: 'Data is empty'));
      }
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, BaseResponseModel<ProductsModel>>>
      getProductsByCategory(int? categoryId) async {
    try {
      final response = await _apiService.getProductsByCategory(categoryId);
      if (response.data.isNullOrEmpty) {
        return Left(AppException(message: 'Data is empty'));
      }
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
