import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:TechnicalTask/features/authentication/authentication_bloc.dart';
import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:TechnicalTask/features/login_register/presentation/bloc/login_bloc.dart';
import 'package:TechnicalTask/features/login_register/presentation/pages/enterotppage.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
  const LoginPage({
    Key key,
    this.userRepository,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
    super.initState();

    //FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginBloc(
              userRepository: widget.userRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            );
          },
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 167,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please enter your phone number to continue.',
                          style: TextStyle(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Color(0xFFFAFAFA),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'phone number'.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF202020),
                          ),
                          //textAlign: TextAlign.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(
                                        0xFF20202033), // red as border color
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '+',
                                          style: TextStyle(
                                            color: Color(0xFFDA2129),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          '91',
                                          style: TextStyle(
                                            color: Color(0xFFDA2129),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xFFDA2129),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 60,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(
                                        0xFF202020), // red as border color
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Center(
                                    child: TextField(
                                      readOnly: true,
                                      controller: _controller,
                                      //  focusNode: ,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_controller.text.length == 10)
                                BlocProvider.of<LoginBloc>(context).add(
                                  ContinuePressed(
                                    mobileNo: int.parse(_controller.text),
                                  ),
                                );

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EnterOtp(
                                    userRepository: widget.userRepository,
                                    mobileNo: int.parse(_controller.text),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              //color:,
                              height: 50,
                              width: MediaQuery.of(context).size.width - 40,
                              child: Center(
                                child: Text(
                                  'Continue'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        2,
                                decoration: BoxDecoration(
                                  color: Color(0xFF20202033),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Text('OR',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 1,
                                width:
                                    ((MediaQuery.of(context).size.width - 60) /
                                        2),
                                decoration: BoxDecoration(
                                  color: Color(0xFF20202033),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF127FFF),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            //color:,
                            height: 50,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Icon(
                                        Icons.local_phone,
                                        size: 30,
                                        color: Color(0xFF127FFF),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Login via True caller',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Color(0xFFD2D5DBF0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '1';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '2';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('A B C')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '3';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('D E F')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '4';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '4',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('G H I')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '5';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '5',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('J K L')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '6';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('M N O')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '7';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '7',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('P Q R S')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '8';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '8',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('T U V')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '9';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '9',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text('W X Y Z')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD2D5DBF0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            height: 50,
                            width: (MediaQuery.of(context).size.width - 50) / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '+ * #'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length <= 9)
                                _controller.text = _controller.text + '0';
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.text.length != 0) {
                                _controller.text = _controller.text
                                    .substring(0, _controller.text.length - 1);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFD2D5DBF0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.arrowLeft,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
