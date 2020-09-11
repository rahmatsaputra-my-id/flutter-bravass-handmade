//import 'dart:async';
//
////import 'package:bravassnotif/pages/form_tambah.dart';
////import 'package:bravassnotif/pages/home_profile.dart';
//import 'package:bravassnotif/utils/my_navigator.dart';
//import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:folding_cell/folding_cell.dart';
//
//Color primaryColor = Color(0xff362c20);
//
//Color latarColor = Colors.white;
//Color bottomNavColor = Color(0xffeff0f1);
//Color blekColor = Color(0xff141518);
//
//GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => new _HomePageState();
//
//}
//
//class _HomePageState extends State<HomePage> {
//  int _currentIndex =0 ;
//  final List<Widget> _children =[];
//
//  void onTabTapped(int index){
//    setState(() {
//      _currentIndex = index;
//    });
//  }
//
//  void initState(){
//    super.initState();
//    Timer(Duration(seconds: 2), () => _HomePageState());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Widget image_carousel =  new Container(
//      height: 200.0,
//      width: 900.0,
//      child:
//      new Carousel(
//          boxFit: BoxFit.cover,
//          images: [
//            AssetImage('images/img1.jpg'),
//            AssetImage('images/img2.jpg'),
//            AssetImage('images/img3.jpg'),
//            AssetImage('images/img4.jpg'),
//            AssetImage('images/img5.jpg'),
//            AssetImage('images/img6.jpg'),
//            AssetImage('images/img7.jpg')
//          ],
//          autoplay: true,
//          autoplayDuration: Duration(milliseconds: 5000),
//          animationCurve: Curves.fastOutSlowIn,
//          animationDuration: Duration(milliseconds: 1000),
//          indicatorBgPadding: 8.0,
//          dotColor: Colors.white,
//          dotSize: 4.0
//      ),
//    );
//
//    return Scaffold(
//      key: _scaffoldState,
//      appBar: new AppBar(
//          elevation: 0.1,
//          backgroundColor: primaryColor,
//          title: Text('Home'),
//          actions: <Widget>[
//            new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
//            new IconButton(icon: Icon(Icons.notifications,color: Colors.white), onPressed: () {
//              Navigator.
//              push(
//                context,
//                MaterialPageRoute(builder: (context)=> NotificationKelas() ),
//              );
//            },)
//          ]
//      ),
//      backgroundColor: latarColor,
//
////      bottomNavigationBar: BottomNavigationBar(
////        onTap: onTabTapped,
////        backgroundColor: bottomNavColor,
////        currentIndex: _currentIndex,
////        items: [
////          new BottomNavigationBarItem(
////            title: Text("Home", style: TextStyle(color: primaryColor)),
////            icon: Icon(Icons.home, color: primaryColor),
////          ),
////          new BottomNavigationBarItem(
////          title: Text("Folder", style: TextStyle(color: primaryColor)),
////          icon: Icon(Icons.folder, color: primaryColor),
////          ),
////        ],
////      ),
//
//      bottomNavigationBar: BottomAppBar(
//        shape: const CircularNotchedRectangle(),
//        notchMargin: 4.0,
//        child: new Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//          children: <Widget>[
//            IconButton(icon: Icon(Icons.home), onPressed: () => MyNavigator.goToProfile(context)),
//            IconButton(icon: Icon(Icons.movie), onPressed: () => MyNavigator.goToMovie(context)),
////            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
////              Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationKelas()));
////            } ),
//          ],
//        ),
//        color: bottomNavColor,
//
//      ),
//
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: (){
//          Navigator.push(
//              _scaffoldState.currentContext,
//              MaterialPageRoute(builder: (BuildContext context){
////                return FormTambah();
//              }),
//          );
//        },
//        backgroundColor: primaryColor,
//      ),
//
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//      drawer: new Drawer(
//        child: new ListView(
//          children: <Widget>[
//            // header
//            new UserAccountsDrawerHeader(
//              accountName: Text('Rahmat Saputra'),
//              accountEmail: Text('rahmatsaputra.me@gmail.com'),
//              currentAccountPicture: GestureDetector(
//                child: new CircleAvatar(
//                  backgroundColor: Colors.brown,
//                  child: Icon(Icons.person,color: Colors.white,),
//                ),
//              ),
//              decoration: new BoxDecoration(
//                  color: primaryColor
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Home Page',textScaleFactor: 1.1),
//                leading: Icon(Icons.home),
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My Account'),
//                leading: Icon(Icons.person),
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My Orders'),
//                leading: Icon(Icons.shopping_basket),
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Categories'),
//                leading: Icon(Icons.dashboard),
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Favourites'),
//                leading: Icon(Icons.favorite),
//              ),
//            ),
//
//            Divider(),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Settings'),
//                leading: Icon(Icons.settings, color: Colors.blue),
//              ),
//            ),
//
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('About'),
//                leading: Icon(Icons.help, color: Colors.green,),
//              ),
//            ),
//          ],
//        ),
//      ),
//
//      body:
//      new ListView(
//        children: <Widget>[
//          image_carousel,
////          HomeProfile()
//
//          Container(
//            child: SimpleFoldingCell(
//              frontWidget: FrontWidget(),
//              innerTopWidget: InnerTopWidget(),
//              innerBottomWidget: InnerBottomWidget(),
//
//              cellSize:   Size(MediaQuery
//                  .of(context)
//                  .size
//                  .width,175),
//              padding: EdgeInsets.all(10.0),
//            ),
//          ),
//
//        ],
//      ),
//
//    );
//  }
//}
//
//Container InnerTopWidget(){
//  return Container(
////    color: Colors.lightGreen,
//  );
//}
//
//Container InnerBottomWidget(){
//  return Container(
////    color: Colors.white,//shadow box
//  );
//}
//
//Container FrontWidget(){
//  return Container (
////    color: Color(0xff2980b9),//shadow box
//    alignment: Alignment.center,
//    child: Column(children: <Widget>[
//      Expanded(
//        flex: 2,
//        child: Container(
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(8.0),
//            color: primaryColor,
//          ),
//
//          child: Container(
//            child: Row(
//              mainAxisAlignment:MainAxisAlignment.center,
//              children: <Widget>[
//
//                Column(
//                  mainAxisAlignment:MainAxisAlignment.center,
//                  children: <Widget>[
//
//                    Container(
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text('Today',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 20.0,
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    Container(
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text('09:00AM',
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 20.0
//                          ),
//                        ),
//                      ),
//                    )
//
//                  ],
//                )
//              ],),
//          ),
//        ),
//      ),
//
//      Expanded(
//        flex: 2,
//        child: Container(
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(8.0),
//            color: bottomNavColor,
//          ),
//
//          child: Container(
//            child: Row(
//              mainAxisAlignment:MainAxisAlignment.center,
//              children: <Widget>[
//
//                Column(
//                  mainAxisAlignment:MainAxisAlignment.center,
//                  children: <Widget>[
//
//                    Container(
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text('Today',
//                          style: TextStyle(
//                            color: primaryColor,
//                            fontSize: 20.0,
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    Container(
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text('09:00AM',
//                          style: TextStyle(
//                              color: primaryColor,
//                              fontSize: 20.0
//                          ),
//                        ),
//                      ),
//                    )
//
//                  ],
//                )
//              ],),
//          ),
//        ),
//      ),
//    ],),
//  );
//}
//
////class KelasBerita extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(
////        elevation: 0.1,
////        backgroundColor: primaryColor,
////        title: Text("Berita Harian"),
////      ),
////      body: ListView.builder(
////      )
////    );
////
////  }
////}
//
//class NotificationKelas extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.1,
//        backgroundColor: primaryColor,
//        title: Text("Notification"),
//      ),
//
//    );
//  }
//}
//
