import 'package:dio/dio.dart';
import 'package:project_shop/data/base/base_response_model.dart';
import 'package:project_shop/data/response_models/categories/category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/categories')
  Future<BaseResponseModel<CategoryModel>> getCategories();
}
