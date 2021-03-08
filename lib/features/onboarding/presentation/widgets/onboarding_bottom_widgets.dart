import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget onboardingBottomWidgets(
    {BuildContext context,
    String one,
    String two,
    String three,
    Function login,
    Function register}) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            one,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            two,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            three,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.red, // red as border color
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                onTap: login,
              ),
              SizedBox(width: 20),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  //color:,
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: register,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
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
        )
      ],
    ),
  );
}
