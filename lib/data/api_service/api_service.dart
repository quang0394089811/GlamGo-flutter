import 'package:dio/dio.dart';
import 'package:project_shop/configs/app_configs.dart';
import 'package:project_shop/data/base/base_response.dart';
import 'package:project_shop/data/response_models/article/article_model.dart';
import 'package:project_shop/data/response_models/categories/category_model.dart';
import 'package:project_shop/data/response_models/products/products_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(CategoryAction.getCategories)
  Future<BaseResponse<List<CategoryModel>>> getCategories();

  @GET(ProductsAction.getProducts)
  Future<BaseResponse<List<ProductsModel>>> getProducts();

  @GET(ProductsAction.getProductsByCategory)
  Future<BaseResponse<List<ProductsModel>>> getProductsByCategory(
    @Query("category_id") int? categoryId,
  );

  @GET(ProductsAction.getProductDetail)
  Future<BaseResponse<ProductsModel>> getProductDetail(
      @Query("id") int? productId);
  
  @GET(ArticleAction.getArticle)
  Future<BaseResponse<List<ArticleModel>>> getArticle(
    @Query("is_hot") int? isHot,
    @Query("category_artical_id") int? categoryArticleId,
  );

  @GET(ArticleAction.getCategoriesArticle)
  Future<BaseResponse<List<CategoryModel>>> getCategoriesArticle();

  @GET(ImageAction.getBanner)
  Future<BaseResponse<List<ProductImage>>> getBanner();
}
