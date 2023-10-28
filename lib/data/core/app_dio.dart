import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dog_app/data/core/api_constants.dart';

class AppDio with DioMixin implements Dio {
  AppDio([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    this.options = options;

    // interceptors.add(
    // LogInterceptor(
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   requestHeader: false,
    // ),
    // );

    httpClientAdapter = IOHttpClientAdapter();
  }
}
