import 'dart:async';

import 'package:TechnicalTask/core/database/user_database_operations.dart';
import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/features/home/data/model/Products.dart';
import 'package:TechnicalTask/features/home/data/repository/products_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final UserDatabaseOps userDatabaseOps;

  ProductBloc({this.productRepository, this.userDatabaseOps})
      : super(ProductInitial(categoryList: productRepository.categoryList));

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is InitialProducts) {
      ApiResult<ProductsApiResponse> products =
          await productRepository.getProductsInfo(
        authString: await userDatabaseOps.getUserToken(34),
        url: 'https://snehaselect-api.tkea.in/api/users/send-otp',
      );
      yield ProductInitial(categoryList: productRepository.categoryList);
    }
  }
}
