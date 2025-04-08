class AppConfigs {
  // static String hostUrl = 'http://192.168.0.112:8000';
  static String hostUrl = 'http://10.10.252.21:8000';
  static String apiUrl = '/api/v1/';
  static String baseUrl = '$hostUrl$apiUrl';
}

class CategoryAction {
  static const getCategories = '/categories';
}

class ProductsAction {
  static const getProducts = '/products';
  static const getProductsByCategory = '/products/get-products-by-category';
}
