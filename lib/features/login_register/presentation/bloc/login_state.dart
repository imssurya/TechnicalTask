part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

// class GoToOtpPage extends LoginState {
//   final int mobileNo;
//   GoToOtpPage({@required this.mobileNo});
//   @override
//   List<Object> get props => [mobileNo];
// }

class OTPVerificationSuccess extends LoginState {}

class OTPVerificationFailed extends LoginState {}
