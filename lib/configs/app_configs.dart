class AppConfigs {
  // static String hostUrl = 'http://192.168.0.105:8000';
  static String hostUrl = 'http://192.168.110.14:8000';
  // static String hostUrl = 'http://10.10.252.81:8000';
  static String apiUrl = '/api/v1';
  static String baseUrl = '$hostUrl$apiUrl';
}

class ImageAction {
  static const getBanner = '/get-banner';
}

class CategoryAction {
  static const getCategories = '/categories';
}

class ProductsAction {
  static const getProducts = '/products';
  static const getProductsByCategory = '/products/get-products-by-category';
  static const getProductDetail = '/products/get-products-details';
}

class ArticleAction {
  static const getArticle = '/artical';
  static const getCategoriesArticle = '/artical/categories';
}
