import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/features/home/data/model/Products.dart';

import 'package:dio/dio.dart';

Dio _dio = Dio();
Future<ApiResult<ProductsApiResponse>> callProductsAPI(
    {String token, String url}) async {
  try {
    //calling api with auth token to get products information
    _dio.options.headers["Authorization"] = "token $token";
    final Response response = await _dio.get(url);
    return ApiResult.success(data: ProductsApiResponse.fromJson(response.data));
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}
