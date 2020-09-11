//import 'package:bravassapp/pages/form_tambah.dart';
//import 'package:bravassapp/pages/home_screen.dart';
//import 'package:bravassapp/pages/home_profile.dart';
//import 'package:bravassapp/pages/movie_data.dart';
//import 'package:bravassapp/pagesMahasiswa/view/form_nambah.dart';
import 'package:bravassapp/pages/movie_data.dart';
import 'package:bravassapp/pagesData/pages/homedata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bravassapp/widget/messaging_widget.dart';

import 'package:bravassapp/pages/home_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
//import 'package:bravassapp/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bravassapp/main.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:bravassapp/pagesMahasiswa/view/home_mahasiswa.dart';
import 'package:bravassapp/pagesMahasiswa/view/form_nambah.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:bravassapp/main.dart';
import 'package:bravassapp/pagesDashoard/view/history.dart';

Color warnaItem = Color(0xff362c20);
Color latarColor = Colors.white;
Color bottomNavColor = Color(0xffeff0f1);
Color blekColor = Color(0xff141518);

//final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =  new GlobalKey<RefreshIndicatorState>();
//
//GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Dahsboard extends StatefulWidget {
  @override
  _DahsboardState createState() => _DahsboardState();
}

class _DahsboardState extends State<Dahsboard> {

  int currentTab = 0;
  final List<Widget> screens = [
    Isi(),
    History(),
    Place(),
//    FormNambah(),
    MovieData(),
//    HomeData(),
    HomeMahasiswa()
  ];
  Widget currentScreen = Isi();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(

      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar:
      bmnav.BottomNav(
        index: currentTab,
        labelStyle: bmnav.LabelStyle(visible: true),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },

        items: [
          bmnav.BottomNavItem(Icons.group, label: 'Forum'),
          bmnav.BottomNavItem(Icons.receipt, label: 'History'),
          bmnav.BottomNavItem(Icons.room_service, label: 'Services'),
          bmnav.BottomNavItem(Icons.account_balance_wallet, label: 'Pocket'),
//          bmnav.BottomNavItem(Icons.movie, label: 'Movie'),
          bmnav.BottomNavItem(Icons.person, label: 'Account')
        ],
      ),
    );
  }
}

class Isi extends StatefulWidget {
  @override
  _IsiState createState() => _IsiState();
}

class _IsiState extends State<Isi> {
  Widget image_carousel = new Container(
    height: 250.0,
    width: 900.0,
    child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/img1.jpg'),
          AssetImage('images/img2.jpg'),
          AssetImage('images/img3.jpg'),
          AssetImage('images/img4.jpg'),
          AssetImage('images/img5.jpg'),
          AssetImage('images/img6.jpg'),
          AssetImage('images/img7.jpg')
        ],

        autoplay: true,
        autoplayDuration: Duration(milliseconds: 5000),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 8.0,
        dotColor: Colors.white,
        dotSize: 4.0),
  );

  Widget carousell = new Container(
      height: 150.0,
//      margin: EdgeInsets.only(top: 16),
      child: CarouselSlider(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 300),
        pauseAutoPlayOnTouch: Duration(seconds: 10),
        items: [
          'https://image.freepik.com/free-vector/freelancer-coworking-business-center-banner_81522-4517.jpg',
          'https://media.istockphoto.com/vectors/coworking-office-promotion-flat-banner-template-vector-id1145747973',
          'https://image.shutterstock.com/image-vector/modern-open-space-coworking-office-260nw-1451257484.jpg',
          'https://image.shutterstock.com/image-vector/modern-business-startup-innovative-company-260nw-1455164630.jpg',
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30),
                          topRight: const Radius.circular(30),
                          bottomLeft: const Radius.circular(30),
                          bottomRight: const Radius.circular(30)),

                  ),
                  child:
                  GestureDetector(
                        child: Image.network(i, fit: BoxFit.cover),
                        onTap: () {
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(i),
                            ),
                          );
                        }),
              );
            },
          );
        }).toList(),
      ));

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color(0xff737373),
              height: 180,
              child: Container(
                child: _buildBottomNavigationMenu(),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(topLeft: const Radius.circular(30),topRight: const Radius.circular(30))
                ),
              )
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Cooling'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.accessibility_new),
          title: Text('People'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.assessment),
          title: Text('Stats'),
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
          elevation: 0.1,

          backgroundColor: warnaItem,
          title: Row(
            children: <Widget>[
//              CircleAvatar(
//                backgroundImage: AssetImage(""),
//              ),
              Text('Bravass', style: TextStyle(fontSize: 16))
            ],
          ),
          actions: <Widget>[
//            new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
//            new IconButton(
//              icon: Icon(Icons.email, color: Colors.white),
//              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMahasiswa())),
////              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage() ),);}
//            ),
            new IconButton(
              icon: Icon(Icons.mail, color: Colors.white),//promotions
              onPressed: () => _onButtonPressed(),
//              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage() ),);}
            ),
//            new IconButton(
//              icon: Icon(Icons.account_balance_wallet, color: Colors.white),
//              onPressed: () => _onButtonPressed(),
////              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage() ),);}
//            ),
//            GestureDetector(
//              onTap: ()=> _onButtonPressed(),
//              child: Container(
//                margin: EdgeInsets.only(right: 16,left: 5),
//                child: new CircleAvatar(
//                  radius: 14,
//                  backgroundImage: AssetImage(""),
//                ),
//              ),
//            ),
          ]
      ),
      body: ListView(
        children: <Widget>[
//          _top(),
//          SizedBox(height: 20),
          image_carousel,
          SizedBox(height: 20),

          Container(
            child: SimpleFoldingCell(
              frontWidget: FrontWidget(),
              innerTopWidget: InnerTopWidget(),
              innerBottomWidget: InnerBottomWidget(),
              cellSize: Size(MediaQuery.of(context).size.width, 175),
              padding: EdgeInsets.all(10.0),
            ),
          ),
          SizedBox(height: 20),

          Container(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _gridItem(Icons.airport_shuttle, "Mobil", NotificationKelas()),
                _gridItem(Icons.add_shopping_cart, "Keranjang", NotificationKelas()),
                _gridItem(Icons.arrow_drop_down_circle, "More", NotificationKelas()),
                _gridItem(Icons.bluetooth_searching, "Blutut", NotificationKelas()),
                _gridItem(Icons.add_location, "Location", NotificationKelas()),
                _gridItem(Icons.arrow_drop_down_circle, "More", NotificationKelas()),
              ],
            ),
          ),
          SizedBox(height: 20),
          carousell,

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text(
                  "LATEST ARTICLE",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          _cardArtikel(1, "Keterangan 1", "20 items"),
          _cardArtikel(2, "Keterangan 2", "12 items"),
          _cardArtikel(3, "Keterangan 3", "8 items"),
          _cardArtikel(4, "Keterangan 4", "7 items"),
        ],
      ),
    );
  }

  _cardArtikel(image, Ket, qty) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: Colors.black,
                  image:
                  DecorationImage(image: AssetImage(""), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Ket,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    qty,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _gridItem(icon, nama, page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                icon,
                size: 16.0,
                color: Colors.white,
              ),
              backgroundColor: warnaItem.withOpacity(0.9),
            ),
            SizedBox(height: 10.0),
            Text(
              nama,
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Container InnerTopWidget() {
    return Container(
//    color: Colors.lightGreen,
    );
  }

  Container InnerBottomWidget() {
    return Container(
//    color: Colors.white,//shadow box
    );
  }

  Container FrontWidget() {
    return Container(
//    color: Color(0xff2980b9),//shadow box
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: warnaItem,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'bravassapp',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: bottomNavColor,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Text(
                              '09:00AM / 09:00PM',
                              style: TextStyle(
                                  color: warnaItem, fontSize: 20.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container FrontWidget2() {
    return Container(
//    color: Color(0xff2980b9),//shadow box
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: RaisedButton(
                onPressed: (){},
                child: const Text(
                  '2:00 PM',
                  style: TextStyle(
                      fontSize: 10
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: RaisedButton(
                onPressed: (){},
                child: const Text(
                  '2:00 PM',
                  style: TextStyle(
                      fontSize: 10
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Place extends StatefulWidget {
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: warnaItem,
            flexibleSpace: SafeArea(
              child: TabBar(
                tabs: [
                  Tab(text: "Meeting Room",/*icon: Icon(Icons.airline_seat_legroom_extra)*/),
                  Tab(text: "Conference Room",/*icon: Icon(Icons.room)*/),
                  Tab(text: "Movie Studio",/*icon: Icon(Icons.library_music)*/),
                ]
              ),
            ),
          ),
          body:
          TabBarView(
            children: <Widget>[
              tabPertama(),
              tabKedua(),
              tabKetiga(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  final String url;
  ImageScreen(this.url);

  @override
  _ImageScreenState createState() => _ImageScreenState(url);
}

class _ImageScreenState extends State<ImageScreen> {
  final String url;
  _ImageScreenState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(url, width: double.infinity,),
    );
  }
}

class FCloudMessaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: warnaItem,
        title: Text("Notification FCM"),
      ),
      body: MessagingWidget(),
    );
  }
}

class NotificationKelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: warnaItem,
        title: Text("Notification"),
      ),

    );
  }
}

class tabPertama extends StatefulWidget {
  @override
  _tabPertamaState createState() => _tabPertamaState();
}

class _tabPertamaState extends State<tabPertama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x00000000),
        centerTitle: true,
        title: Text("Meeting Room"),
      ),*/
      body: ListView(
        children: <Widget>[
          _cardEvent("Center Stage", "GROUND FLOOR", "20 juta/hr","images/img1.jpg", "20"),
          _cardEvent("Top Stage", "UPPER GROUND FLOOR", "40 juta/hr","images/img2.jpg", "30"),
          _cardEvent("Bottom Stage", "LOWER GROUND FLOOR", "20 juta/hr","images/img3.jpg", "25"),
        ],
      ),
    );
  }
  _cardEvent(judul, lantai, harga,img, jumlah_bangku) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              margin: EdgeInsets.only(bottom: 8),
              children: <Widget>[
                Text(
                  judul,
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      lantai,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Container(
                    child: Text(
                      harga,
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 999,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          jumlah_bangku,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'SEATS',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.laptop_chromebook)
                      ),
                      Container(
                        child: Text(
                          'Monitor',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.personal_video)
                      ),
                      Container(
                        child: Text(
                          'Whiteboard',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.wifi)
                      ),
                      Container(
                        child: Text(
                          'Wifi',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '2:00 PM',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '60 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '90 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '120 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class tabKedua extends StatefulWidget {
  @override
  _tabKeduaState createState() => _tabKeduaState();
}

class _tabKeduaState extends State<tabKedua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x00000000),
        centerTitle: true,
        title: Text("Conference Room"),
      ),*/
      body:
      ListView(
        children: <Widget>[
          _cardEvent("Center Stage", "GROUND FLOOR", "20 juta/hr","images/img1.jpg", "20"),
          _cardEvent("Top Stage", "UPPER GROUND FLOOR", "40 juta/hr","images/img2.jpg", "30"),
          _cardEvent("Bottom Stage", "LOWER GROUND FLOOR", "20 juta/hr","images/img3.jpg", "25"),
        ],
      ),
    );
  }
  _cardEvent(judul, lantai, harga,img, jumlah_bangku) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              margin: EdgeInsets.only(bottom: 8),
              children: <Widget>[
                Text(
                  judul,
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      lantai,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Container(
                    child: Text(
                      harga,
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 999,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          jumlah_bangku,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'SEATS',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.laptop_chromebook)
                      ),
                      Container(
                        child: Text(
                          'Monitor',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.personal_video)
                      ),
                      Container(
                        child: Text(
                          'Whiteboard',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.wifi)
                      ),
                      Container(
                        child: Text(
                          'Wifi',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '2:00 PM',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '60 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '90 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '120 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class tabKetiga extends StatefulWidget {
  @override
  _tabKetigaState createState() => _tabKetigaState();
}

class _tabKetigaState extends State<tabKetiga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x00000000),
        centerTitle: true,
        title: Text("Movie Studio"),
      ),*/
      body: ListView(
        children: <Widget>[
          _cardEvent("Center Stage", "GROUND FLOOR", "20 juta/hr","images/img1.jpg", "20"),
          _cardEvent("Top Stage", "UPPER GROUND FLOOR", "40 juta/hr","images/img2.jpg", "30"),
          _cardEvent("Bottom Stage", "LOWER GROUND FLOOR", "20 juta/hr","images/img3.jpg", "25"),
        ],
      ),
    );
  }
  _cardEvent(judul, lantai, harga,img, jumlah_bangku) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
//              margin: EdgeInsets.only(bottom: 8),
              children: <Widget>[
                Text(
                  judul,
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      lantai,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Container(
                    child: Text(
                      harga,
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 999,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          jumlah_bangku,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'SEATS',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.laptop_chromebook)
                      ),
                      Container(
                        child: Text(
                          'Monitor',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.personal_video)
                      ),
                      Container(
                        child: Text(
                          'Whiteboard',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.wifi)
                      ),
                      Container(
                        child: Text(
                          'Wifi',
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '2:00 PM',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '60 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '90 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: RaisedButton(
                      onPressed: (){},
                      child: const Text(
                        '120 MIN',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}


