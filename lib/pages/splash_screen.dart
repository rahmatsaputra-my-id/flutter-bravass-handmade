import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bravassapp/utils/my_navigator.dart';
import 'package:bravassapp/utils/takata.dart';

Color primaryColor = Color(0xff362c20);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () => MyNavigator.goToDashboard(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Container(
              decoration: BoxDecoration(color: primaryColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.shopping_cart,
                            color: primaryColor,
                            size: 50.0,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          Takata.judul_splash,style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
