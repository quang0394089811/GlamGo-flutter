class AppConfigs {
  // static String hostUrl = 'http://192.168.0.103:8000';
  static String hostUrl = 'http://192.168.110.7:8000';
  // static String hostUrl = 'http://10.10.252.81:8000';
  static String apiUrl = '/api/v1';
  static String baseUrl = '$hostUrl$apiUrl';
}

class CategoryAction {
  static const getCategories = '/categories';
}

class ProductsAction {
  static const getProducts = '/products';
  static const getProductsByCategory = '/products/get-products-by-category';
  static const getProductDetail = '/products/get-products-details';
}
