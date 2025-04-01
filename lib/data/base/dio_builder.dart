import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_shop/configs/app_configs.dart';
import 'package:project_shop/data/secure_storage/secure_storage.dart';

class DioBuilder {

  static Dio build(SecureStorage secureStorage) {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfigs.baseUrl,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    ));

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print('Request: ${options.path}');
        // if (options.path.contains('login')) return handler.next(options);
        // final accessToken = await secureStorage.getAccessToken();
        // final accessToken = "AppConfigs.accessToken";
        // options.headers['Authorization'] = 'Bearer $accessToken';
        printCurlCommand(options);
        return handler.next(options);
      },
    ));

    return dio;
  }
  static void printCurlCommand(RequestOptions options) {
    final curl = StringBuffer('curl -X ${options.method} \'${options.uri}\'');
    options.headers.forEach((k, v) {
      curl.write(' -H \'$k: $v\'');
    });
    if (options.data != null) {
      curl.write(' --data-binary \'${options.data}\'');
    }
    print(curl.toString());
  }
}