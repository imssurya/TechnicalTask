import 'dart:async';
import 'package:TechnicalTask/core/database/user_database_operations.dart';
import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/core/model/token.dart';
import 'package:TechnicalTask/features/login_register/data/datasources/send_otp_call.dart';
import 'package:TechnicalTask/features/login_register/data/model/otppost.dart';
import 'package:TechnicalTask/features/login_register/data/model/otpsuccessmodel.dart';
import 'package:TechnicalTask/features/login_register/data/model/user_login.dart';
import 'package:TechnicalTask/features/login_register/data/model/user_model.dart'
    as um;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final userDatabaseOps = UserDatabaseOps();
  Future<ApiResult<um.User>> authenticate({
    @required int phno,
    @required String url,
  }) async {
    UserLogin userLogin = UserLogin(countryCode: 91, phno: phno);
    ApiResult<Token> token = await getTokenUsingLogin(userLogin, url);

    return token.when(
      success: (token) {
        um.User user = um.User(
          id: 0,
          username: phno.toString(),
          token: token.token,
        );
        return ApiResult.success(data: user);
      },
      failure: (NetworkExceptions error) {
        return ApiResult.failure(error: error);
      },
    );
  }

  Future<ApiResult<um.User>> verifyOTP({
    @required int phno,
    @required String url,
    @required String otp,
    //  @required String phno,
  }) async {
    DeviceInfo deviceInfo = DeviceInfo(
        appVersion: "1.7.0",
        deviceId: "457",
        ip: "127.0.0.1",
        osVersion: "12.0",
        platform: "ANDROID",
        pushToken: "asdasda");
    OTPPost otpPost = OTPPost(
        countryCode: '91',
        deviceInfo: deviceInfo,
        otp: otp,
        phoneNumber: phno.toString());
    ApiResult<OTPSuccessResponse> otpResult = await callVerifyOTP(otpPost, url);

    return otpResult.when(
      success: (otpResult) {
        OTPSuccessResponse otpSuccessResponse = OTPSuccessResponse(
          data: otpResult.data,
          statusCode: otpResult.statusCode,
          success: otpResult.success,
          timestamp: otpResult.timestamp,
        );
        um.User user = um.User(
          id: otpResult.data.user.id,
          token: otpResult.data.authToken,
          username: otpResult.data.user.phoneNumber.toString(),
        );
        return ApiResult.success(data: user);
      },
      failure: (NetworkExceptions error) {
        return ApiResult.failure(error: error);
      },
    );
  }

  Future<void> persistToken({@required um.User user}) async {
    // write token with the user to the database
    await userDatabaseOps.createUser(user);
  }

  Future<void> deleteToken({@required int id}) async {
    await userDatabaseOps.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await userDatabaseOps.checkUser(0);
    return result;
  }

  bool showProgressBar() {
    bool showProgress = false;
    return showProgress;
  }
}
