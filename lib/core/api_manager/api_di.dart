import 'package:dio/dio.dart';
import 'package:flower_tracking/core/models/user_model.dart';

import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_manager.dart';

@module
abstract class DioInjection {
  @Singleton()
  Dio injectDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
      ),
    );

    dio.options.headers["Content-Type"] = "multipart/form-data";
    dio.options.contentType = "multipart/form-data";

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = UserModel.instance.token;
        print("Sending request with token: $token");
        if (token != null && token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));

    return dio;
  }

  @Singleton()
  RestClient injectRestClient(Dio dio) {
    return RestClient(dio);
  }

}