import 'dart:async';
import 'package:TechnicalTask/features/login_register/data/model/user_model.dart';
import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.userRepository})
      : assert(UserRepository != null),
        super(AuthenticationUnauthenticated());

  final UserRepository userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      //checking database whether the token exists in table is exist we are allowing user directly to homepage or else loginpage or register page
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      //when user successfully logged in we are storing the token in user table
      await userRepository.persistToken(user: event.user);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      //when user logged out then we are removing particular user in user table so when user comeback again he wont directly go to homepage.
      await userRepository.deleteToken(id: 0);

      yield AuthenticationUnauthenticated();
    }
  }
}
