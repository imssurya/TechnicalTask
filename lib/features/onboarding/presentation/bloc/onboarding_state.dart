part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends OnboardingState {}

class LoginPressed extends OnboardingState {}

class RegisterPressed extends OnboardingState {}
