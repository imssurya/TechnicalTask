part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ContinuePressed extends LoginEvent {
  final int mobileNo;

  ContinuePressed({@required this.mobileNo});

  List<Object> get props => [mobileNo];
}

class VerfyOTP extends LoginEvent {
  final int otp;
  final int phno;
  VerfyOTP({
    this.phno,
    this.otp,
  });
  List<Object> get props => [otp, phno];
}
