import 'package:flutter/material.dart';

import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:TechnicalTask/features/login_register/presentation/pages/loginpage.dart';
import 'package:TechnicalTask/features/login_register/presentation/pages/registerpage.dart';
import 'package:TechnicalTask/features/onboarding/presentation/widgets/onboarding_bottom_widgets.dart';

class Onboarding extends StatefulWidget {
  final UserRepository userRepository;
  const Onboarding({
    Key key,
    this.userRepository,
  }) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numOfPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _bottomController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numOfPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24 : 16,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFFF4444C) : Color(0xFFDA2129),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void login() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginPage(
              userRepository: widget.userRepository,
            )));
  }

  void register() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RegisterPage(
              userRepository: widget.userRepository,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 400.0,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (currentPgNo) {
                  setState(() {
                    _currentPage = currentPgNo;
                    _bottomController.jumpToPage(currentPgNo);
                  });
                },
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage('assets/Capture.PNG'),
                          fit: BoxFit.fill,
                          height: 300.0,
                          width: 300.0,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage('assets/Capture3.PNG'),
                          height: 300.0,
                          fit: BoxFit.fill,
                          width: 300.0,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage('assets/Capture1.PNG'),
                          height: 300.0,
                          fit: BoxFit.fill,
                          width: 300.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            Container(
              height: 260.0,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _bottomController,
                onPageChanged: (currentPgNo) {
                  setState(() {
                    _currentPage = currentPgNo;
                    _pageController.jumpToPage(currentPgNo);
                  });
                },
                children: <Widget>[
                  onboardingBottomWidgets(
                    context: context,
                    one: 'Get Express',
                    two: 'for faster deliveries.',
                    three: 'In love with meat register now & get offers.',
                    login: login,
                    register: register,
                  ),
                  onboardingBottomWidgets(
                    context: context,
                    one: 'Find your',
                    two: 'favorite meat',
                    three: 'In love with meat register now & get offers.',
                    login: login,
                    register: register,
                  ),
                  onboardingBottomWidgets(
                    context: context,
                    one: 'Get deliveries',
                    two: 'at your doorstep',
                    three: 'In love with meat register now & get offers.',
                    login: login,
                    register: register,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
