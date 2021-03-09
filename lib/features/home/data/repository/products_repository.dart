import 'dart:async';
import 'package:TechnicalTask/core/database/user_database_operations.dart';
import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/features/home/data/datasources/send_otp_call.dart';
import 'package:TechnicalTask/features/home/data/model/Products.dart';
import 'package:TechnicalTask/features/login_register/data/model/user_model.dart'
    as um;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  //here we are extracting information from json to classes and objects
  List<Hub> categoryList = [];
  final userDatabaseOps = UserDatabaseOps();
  Future<ApiResult<ProductsApiResponse>> getProductsInfo({
    @required String authString,
    @required String url,
  }) async {
    ApiResult<ProductsApiResponse> products =
        await callProductsAPI(token: authString, url: url);

    return products.when(
      success: (products) {
        ProductsApiResponse productsApiResponse = ProductsApiResponse(
          data: products.data,
          statusCode: products.statusCode,
          success: products.success,
          timestamp: products.timestamp,
        );

        for (Products category in productsApiResponse.data.products) {
          categoryList.add(category.category);
        }

        return ApiResult.success(data: productsApiResponse);
      },
      failure: (NetworkExceptions error) {
        return ApiResult.failure(error: error);
      },
    );
  }

  Future<String> getAuthString() async {
    return await userDatabaseOps.getUserToken(0);
  }
}
