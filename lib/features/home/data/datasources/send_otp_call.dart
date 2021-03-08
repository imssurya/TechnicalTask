import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/core/model/token.dart';

import 'package:dio/dio.dart';

Dio _dio = Dio();
Future<ApiResult<Token>> getPostData(String token, String url) async {
  try {
    _dio.options.headers["Authorization"] = "token $token";
    final Response response = await _dio.get(url);
    return ApiResult.success(data: Token.fromJson(response.data));
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}
