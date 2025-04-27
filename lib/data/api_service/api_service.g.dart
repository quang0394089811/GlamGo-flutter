// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<List<CategoryModel>>> getCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<CategoryModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<CategoryModel>> _value;
    try {
      _value = BaseResponse<List<CategoryModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CategoryModel>(
                  (i) => CategoryModel.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ProductsModel>>> getProducts() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<ProductsModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ProductsModel>> _value;
    try {
      _value = BaseResponse<List<ProductsModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ProductsModel>(
                  (i) => ProductsModel.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ProductsModel>>> getProductsByCategory(
    int? categoryId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'category_id': categoryId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<ProductsModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products/get-products-by-category',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ProductsModel>> _value;
    try {
      _value = BaseResponse<List<ProductsModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ProductsModel>(
                  (i) => ProductsModel.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ProductsModel>> getProductDetail(int? productId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': productId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ProductsModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/products/get-products-details',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ProductsModel> _value;
    try {
      _value = BaseResponse<ProductsModel>.fromJson(
        _result.data!,
        (json) => ProductsModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
