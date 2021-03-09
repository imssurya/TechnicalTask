import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/core/model/token.dart';
import 'package:TechnicalTask/features/login_register/data/model/otppost.dart';
import 'package:TechnicalTask/features/login_register/data/model/otpsuccessmodel.dart';
import 'package:TechnicalTask/features/login_register/data/model/user_login.dart';

import 'package:dio/dio.dart';

//calling below api to get otp infoamation for login purposes
Dio _dio = Dio();
Future<ApiResult<Token>> getTokenUsingLogin(
    UserLogin userLogin, String url) async {
  try {
    final Response response = await _dio.post(
      url,
      data: userLogin.toDatabaseJson(),
    );
    return ApiResult.success(data: Token.fromJson(response.data));
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}

//calling below api to verify otp and get authstring information
Future<ApiResult<OTPSuccessResponse>> callVerifyOTP(
    OTPPost otpPost, String url) async {
  try {
    final Response response = await _dio.post(
      url,
      data: otpPost.toJson(),
    );
    return ApiResult.success(data: OTPSuccessResponse.fromJson(response.data));
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}
