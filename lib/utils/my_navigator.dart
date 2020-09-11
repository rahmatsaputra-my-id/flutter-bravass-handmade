import 'package:flutter/material.dart';

class MyNavigator{

  static void goToHome(BuildContext context){
    Navigator.pushReplacementNamed( context, "/home");
  }

  static void goToSplashScreen(BuildContext context){
    Navigator.pushNamed(context, "/intro");
  }

  static void goToRuangData(BuildContext context){
    Navigator.pushNamed(context, "/ruang");
  }

  static void goToMovie(BuildContext context){
    Navigator.pushNamed(context, "/movie");
  }

  static void goToProfile(BuildContext context){
    Navigator.pushNamed(context, "/profilee");
  }

  static void goToDashboard(BuildContext context){
    Navigator.pushReplacementNamed(context, "/dashboard");
  }

}