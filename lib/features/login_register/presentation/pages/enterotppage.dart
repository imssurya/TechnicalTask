import 'package:TechnicalTask/features/home/presentation/pages/hompage_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:TechnicalTask/features/authentication/authentication_bloc.dart';
import 'package:TechnicalTask/features/login_register/data/repository/user_repository.dart';
import 'package:TechnicalTask/features/login_register/presentation/bloc/login_bloc.dart';

class EnterOtp extends StatefulWidget {
  final UserRepository userRepository;
  final int mobileNo;
  EnterOtp({
    Key key,
    this.userRepository,
    this.mobileNo,
  }) : super(key: key);

  @override
  _EnterOtpState createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  TextEditingController _otpController = TextEditingController();
  String otp = '';

  @override
  void initState() {
    _otpController.addListener(() {
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
          if (state is LoginInitial) {
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
                            'Verify Phone No.',
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
                            'Please enter OTP sent to ${widget.mobileNo}',
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
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'enter OTP'.toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF202020),
                            ),
                            //textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0 ? '' : otp[0],
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0
                                            ? ''
                                            : otp.length >= 2
                                                ? otp[1]
                                                : '',
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0
                                            ? ''
                                            : otp.length >= 3
                                                ? otp[2]
                                                : '',
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0
                                            ? ''
                                            : otp.length >= 4
                                                ? otp[3]
                                                : '',
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0
                                            ? ''
                                            : otp.length >= 5
                                                ? otp[4]
                                                : '',
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                      child: Text(
                                        otp.length == 0
                                            ? ''
                                            : otp.length >= 6
                                                ? otp[5]
                                                : '',
                                        style: TextStyle(
                                          color: Color(0xFFDA2129),
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45.0),
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<LoginBloc>(context).add(
                                  VerfyOTP(
                                    otp: int.parse(otp),
                                    phno: widget.mobileNo,
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
                                    'Verify'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 165,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '1';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '2';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '3';
                                  }
                                });
                                //    if (otp.length <= 5) otp = otp + '3';
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '4';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '5';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '6';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '7';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '8';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '9';
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                              width:
                                  (MediaQuery.of(context).size.width - 50) / 3,
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
                                setState(() {
                                  if ((otp.isEmpty || otp.isNotEmpty) &&
                                      otp.length <= 5) {
                                    otp = otp + '0';
                                  }
                                  print(otp);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
                                setState(() {
                                  if (otp.length != 0) {
                                    otp = otp.substring(0, otp.length - 1);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFD2D5DBF0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 50,
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
          }
          if (state is OTPVerificationSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (_) => MyPage()));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            });
          }
        },
      ),
    );
  }
}
