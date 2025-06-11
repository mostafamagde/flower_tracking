import 'package:dio/dio.dart';

import '../exceptions/exceptions_impl.dart';
import '../models/result.dart';

class ApiCallHandler {
  static Future<Result<T>> safeApiCall<T>(Future<Result<T>> Function() call) async {
    try {
      return await call();
    } on DioException catch (ex) {
      return Error(ClientError(errorModel: ex.response?.data));
    }
  }
}