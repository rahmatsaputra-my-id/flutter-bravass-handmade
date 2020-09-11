import 'package:bravassapp/pagesData/model/room.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class RoomViewModel {

  static List<Room> rooms = new List <Room>();
  static Room selected = new Room();

  static Future load() async{
    List jsonParsed = json.decode(await getRoom());
    rooms = jsonParsed.map((i) => new Room.fromJson(i)).toList();
    selected = rooms[0];
  }
  
  static Future <String> getRoom() async {
    return await rootBundle.loadString('assets/rooms.json');
  }
}