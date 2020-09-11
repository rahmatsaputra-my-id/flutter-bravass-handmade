import 'package:bravassapp/pagesData/pages/homedata.dart';
import 'package:bravassapp/pagesData/viewmodel/room_viewmodel.dart';
import 'package:bravassapp/widget/messaging_widget.dart';
import 'package:flutter/material.dart';

import 'package:bravassapp/pages/movie_data.dart';
import 'package:bravassapp/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bravassapp/pages/home_screen.dart';
import 'package:bravassapp/pages/splash_screen.dart';
//import 'package:bravassapp/pages/home_profile.dart';
import 'package:bravassapp/pages/dashboard.dart';


//void main() => runApp(MyApp());
//final String appTittle = "Bravass";
//
//class MyApp extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) => MaterialApp(
//      title: appTittle,
//      home: MainPage(appTitle: appTittle),
//    );
//}

//class MainPage extends StatelessWidget {
//  final String appTitle;
//
//  const MainPage({this.appTitle});
//
//  @override
//  Widget build(BuildContext context) => Scaffold(
//      appBar: AppBar(
//        title: Text(appTitle),
//      ),
//      body: MessagingWidget(),
//    );
//}


void main() async{
//  await RoomViewModel.load();
  runApp(
//    HomeData()
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes,
        theme: ThemeData(
          primaryColor: Color(0xff362c20),
          accentColor: Colors.green,
//          brightness: Brightness.dark
        ),
      )
  );
}


var routes = <String, WidgetBuilder>{
//  "/home": (BuildContext context) =>HomePage(),
  "/intro": (BuildContext context) =>SplashScreen(),
  "/movie": (BuildContext contex) =>MovieData(),
//  "/profilee": (BuildContext contex) =>HomeProfile(),
  "/dashboard": (BuildContext contex) =>Dahsboard(),
};




