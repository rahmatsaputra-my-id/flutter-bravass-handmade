import 'package:flutter/material.dart';
import 'package:bravassapp/pagesDashoard/view/app_theme.dart';

Color warnaItem = Color(0xff362c20);

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: warnaItem,
            flexibleSpace: SafeArea(
              child: TabBar(
                  tabs: [
                    Tab(
                      text: "On Progress", /*icon: Icon(Icons.airline_seat_legroom_extra)*/),
                    Tab(text: "Completed", /*icon: Icon(Icons.room)*/),
//                    Tab(text: "Movie Studio",icon: Icon(Icons.library_music)),
                  ]
              ),
            ),
          ),
          body:
          TabBarView(
            children: <Widget>[
              tabPertama(),
              tabKedua(),
//              tabKetiga(),
            ],
          ),
        ),
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

      body: OnProgrees()
//      ListView(
//        children: <Widget>[
//          _cardEvent(
//              "Center Stage", "GROUND FLOOR", "20 juta/hr", "images/img1.jpg",
//              "20"),
//          _cardEvent("Top Stage", "UPPER GROUND FLOOR", "40 juta/hr",
//              "images/img2.jpg", "30"),
//          _cardEvent("Bottom Stage", "LOWER GROUND FLOOR", "20 juta/hr",
//              "images/img3.jpg", "25"),
//        ],
//      ),
    );
  }

  _cardEvent(judul, lantai, harga, img, jumlah_bangku) {
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
                      fontSize: 16, fontWeight: FontWeight.bold
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
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
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
                              fontSize: 12, fontWeight: FontWeight.bold
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
                              fontSize: 12, fontWeight: FontWeight.bold
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
                              fontSize: 12, fontWeight: FontWeight.bold
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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

class OnProgrees extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
                "Kamu sudah menyelesaikan semua transaksi",
                style: TextStyle(
                    color: Colors.black
                )
            ),
          ),
        ],
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
//      appBar: AppBar(
//        elevation: 0.1,
//        backgroundColor: Color(0x00000000),
//        centerTitle: true,
//        title: Text("Conference Room"),
//      ),
      body:
      RoomInfo()
    );
  }
}

class RoomInfo extends StatefulWidget {
  @override
  _RoomInfoState createState() => _RoomInfoState();
}

class _RoomInfoState extends State<RoomInfo> with TickerProviderStateMixin {

  final infoHeight = 364.0;

  AnimationController animationController;
  Animation<double> animation;

  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();

    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tempHeight = (MediaQuery
        .of(context)
        .size
        .height - (MediaQuery
        .of(context)
        .size
        .width / 1.2) + 24.0);

    return Container(
      color:AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset('images/img1.jpg',fit: BoxFit.fill,),
                )
              ],
            ),
            Positioned(
              top: (MediaQuery
                  .of(context)
                  .size
                  .width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color:AppTheme.nearlyWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:AppTheme.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight:
                          tempHeight > infoHeight ? tempHeight : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16
                            ),
                            child: Text(
                              "Judul",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color:AppTheme.darkerText,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "\$28.99",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: AppTheme.nearlyBlue,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "4.3",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 22,
                                          letterSpacing: 0.27,
                                          color: AppTheme.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.nearlyBlue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  getBox("24", "Seats"),
                                  getBox("30 Mins", "Time"),
                                  getBox("24", "Seats"),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 8, bottom: 8
                                ),
                                child: Text(
                                  "Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: AppTheme.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),

                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16, bottom: 16, right: 16
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.nearlyWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)
                                        ),
                                        border: new Border.all(
                                          color: AppTheme.grey.withOpacity(0.2),
                                        )
                                      ),

                                      child: Icon(
                                        Icons.add,
                                        color: AppTheme.nearlyBlue,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),

                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.nearlyBlue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.nearlyBlue.withOpacity(0.5),
                                            offset: Offset(1.1,1.1),
                                            blurRadius: 10.0
                                          )
                                        ]
                                      ),

                                      child: Center(
                                        child: Text(
                                          "Book Room",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            color: AppTheme.nearlyWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).padding.bottom)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: (MediaQuery.of(context).size.width /1.2) - 24.0 - 35,
              right: 35,
              child: new ScaleTransition(
                  alignment: Alignment.center,
                  scale: new CurvedAnimation(
                      parent: (animationController),
                      curve: Curves.fastOutSlowIn),
                child: Card(
                  color: AppTheme.nearlyBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: AppTheme.nearlyWhite,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget getBox(String text1, String text2){
    return Padding (
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.grey.withOpacity(0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 8.0
            )
          ]
        ),

        child: Padding(
          padding: const EdgeInsets.only(
            left: 18.0, right: 18.0, top: 12.0, bottom: 12.0
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlue,
                ),
              ),

              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color:AppTheme.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


