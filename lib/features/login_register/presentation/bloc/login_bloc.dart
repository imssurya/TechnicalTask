import 'dart:async';

import 'package:TechnicalTask/core/error_handling/api_result.dart';
import 'package:TechnicalTask/core/error_handling/network_exceptions.dart';
import 'package:TechnicalTask/features/authentication/authentication_bloc.dart';
import 'package:TechnicalTask/features/login_register/data/model/user_model.dart'
    as um;
import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ContinuePressed) {
      ApiResult<um.User> user = await userRepository.authenticate(
        phno: event.mobileNo,
        url: 'https://snehaselect-api.tkea.in/api/users/send-otp',
      );

      //yield GoToOtpPage(mobileNo: event.mobileNo);
    }
    if (event is VerfyOTP) {
      ApiResult<um.User> otpSuccess = await userRepository.verifyOTP(
        otp: event.otp.toString(),
        phno: event.phno,
        url: 'https://snehaselect-api.tkea.in/api/users/sessions',
      );
      yield* otpSuccess.when(
        success: (otpSuccess) async* {
          authenticationBloc.add(LoggedIn(user: otpSuccess));
          yield LoginInitial();
          yield OTPVerificationSuccess();
        },
        failure: (NetworkExceptions error) async* {
          // yield LoginFaliure(error: NetworkExceptions.getErrorMessage(error));
          //   yield RemoveBlockForLoginButton();
        },
      );
    }
  }
}
