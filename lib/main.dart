import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/sizeconfig.dart';
import 'core/widgets/loading_indicator.dart';
import 'features/authentication/authentication_bloc.dart';
import 'features/home/presentation/pages/hompage_page.dart';
import 'features/onboarding/presentation/pages/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticationUninitialized) {}
                if (state is AuthenticationAuthenticated) {
                  return Homepage();
                }
                if (state is AuthenticationUnauthenticated) {
                  return Onboarding(
                    userRepository: userRepository,
                  );
                }
                if (state is AuthenticationLoading) {
                  return LoadingIndicator();
                }
              },
            ),
          );
        });
      },
    );
  }
}
