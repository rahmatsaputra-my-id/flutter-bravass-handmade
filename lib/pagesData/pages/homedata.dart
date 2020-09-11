import 'dart:ui';
import 'package:bravassapp/pagesData/model/room.dart';
import 'package:flutter/material.dart';
import 'package:bravassapp/pagesData/viewmodel/room_viewmodel.dart';

//class RoomApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        brightness: Brightness.dark,
//        primaryColor: Colors.white,
//        accentColor: Colors.white,
//        dialogBackgroundColor: Colors.transparent
//      ),
//      home: HomeData(),
//    );
//  }
//}


class HomeData extends StatefulWidget{
  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  bool displayText;
  bool selectedIngredients;
  bool selectedInstructions;
  bool selectedInfo;

  @override
  void initState() {
    // TODO: implement initState
    displayText = true;
    selectedIngredients = false;
    selectedInstructions = false;
    selectedInfo = false;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Material(

        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              InkWell(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    key: ValueKey<int>(RoomViewModel.selected.id),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.dstOut),
                            image: AssetImage(
                                'assets/' + RoomViewModel.selected.image),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 5 + 16.0,
                        left: 16.0,
                        right: (MediaQuery.of(context).size.width / 3) - 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: displayText ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Text(
                              RoomViewModel.selected.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 34.0),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: displayText ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                RoomViewModel.selected.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (!displayText) {
                    setState(() {
                      displayText = true;
                      selectedIngredients = false;
                      selectedInstructions = false;
                      selectedInfo = false;
                    });
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    frostedRound(TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.3),
                          border: InputBorder.none,
                          hintText: "Search",
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(Icons.search)),
                    )),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child:
                      frostedIconButton(IconButton(
                        icon: Icon(Icons.restaurant_menu,
                            color: selectedIngredients
                                ? Colors.white
                                : Colors.white70),
                        onPressed: () {
                          setState(() {
                            if (displayText) {
                              displayText = false;
                            }
                            if (displayText) {
                              displayText = true;
                              selectedIngredients = false;
                            } else {
                              selectedIngredients = true;
                              selectedInstructions = false;
                              selectedInfo = false;
                            }
                          });
                        },
                      )),
                    ),
                    frostedIconButton(IconButton(
                      icon: Icon(
                        Icons.list,
                        color: selectedInstructions
                            ? Colors.white
                            : Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          if (displayText) {
                            displayText = false;
                          }
                          if (selectedInstructions) {
                            displayText = true;
                            selectedInstructions = false;
                          } else {
                            selectedIngredients = false;
                            selectedInstructions = true;
                            selectedInfo = false;
                          }
                        });
                      },
                    )),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child:
                      frostedIconButton(
                        IconButton(
                          icon: Icon(
                            Icons.info_outline,
                            color: selectedInfo ? Colors.white : Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              if (displayText) {
                                displayText = false;
                              }
                              if (selectedInstructions) {
                                displayText = true;
                                selectedInstructions = false;
                              } else {
                                selectedIngredients = false;
                                selectedInstructions = true;
                                selectedInfo = false;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: RoomViewModel.rooms.length,
                          itemBuilder: (context, index) {
                            return roomCard(context, index);
                          }),
                    )
                  ],
                ),
              ),

              AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: selectedIngredients
                      ? listCard(context, 'Ingredients',
                      RoomViewModel.selected.ingredients)
                      : Container(height: 0, width: 0)),
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: selectedInstructions
                      ? listCard(context, 'Instructions',
                      RoomViewModel.selected.instructions)
                      : Container(height: 0, width: 0)),
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: selectedInfo
                      ? infoCard(context, 'Info')
                      : Container(height: 0, width: 0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(BuildContext context, String title) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                  child: ListView(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                        child: Text("Ready in " +
                            RoomViewModel.selected.readyInMinutes.toString() +
                            " mins"))),
                Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                        child: Text("Serves " +
                            RoomViewModel.selected.servings.toString()))),
                Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Vegan       ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RoomViewModel.selected.vegan
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          ),
                          Text(
                            "Vegetarian",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RoomViewModel.selected.vegetarian
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Diary Free  ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RoomViewModel.selected.dairyFree
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          ),
                          Text(
                            "  Gluten Free",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RoomViewModel.selected.glutenFree
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          )
                        ])),
                Text(RoomViewModel.selected.description),
              ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.favorite_border),
                    onTap: () {
                      //add to favourites
                    },
                  ),
                  InkWell(
                    child: Icon(Icons.launch),
                    onTap: () {
                      //launch website here using sourceUrl
                      print(RoomViewModel.selected.sourceUrl);
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }

  Widget roomCard(BuildContext context, int index) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(right: 16.0, top: 32.0),
          child: frostedEdged(Container(
              width: MediaQuery.of(context).size.width / 1.75,
              color: Colors.white.withOpacity(0.3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height: MediaQuery.of(context).size.width / 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/' +
                                              RoomViewModel
                                                  .rooms[index].image)))),
                            ])),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width / 3.5),
                              child: Text(RoomViewModel.rooms[index].title,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.schedule,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(
                                RoomViewModel.rooms[index].readyInMinutes
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 8.0)),
                              Icon(
                                Icons.restaurant,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(
                                  RoomViewModel.rooms[index].servings
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0)),
                              Icon(
                                Icons.thumb_up,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(RoomViewModel.rooms[index].likes.toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  )),
                            ],
                          )
                        ])
                  ])))),
      onTap: () {
        setState(() {
          RoomViewModel.selected = RoomViewModel.rooms[index];
        });
      },
    );
  }

  Widget frostedRound(Widget anak) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
          child: anak,
        ),
      ),
    );
  }

  Widget listCard(BuildContext context, String title, List<String> list) {
    return frostedEdged(
        Container(
          key: ValueKey<String>(title),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.5,
          color: Colors.white.withOpacity(0.3),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(color: Colors.white70)),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(list[index]));
                    },
                  ),
                )
            ]
          )
        )
    );
  }

  Widget frostedIconButton(Widget anak) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: anak)));
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }
}
