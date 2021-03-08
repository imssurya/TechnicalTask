part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class ShowProgressBarEvent extends OnboardingEvent {
  final bool showProgress;

  ShowProgressBarEvent({@required this.showProgress});

  List<Object> get props => [showProgress];
}

class LoginButtonPressed extends OnboardingEvent {
  const LoginButtonPressed();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends OnboardingEvent {
  const RegisterButtonPressed();

  @override
  List<Object> get props => [];
}
