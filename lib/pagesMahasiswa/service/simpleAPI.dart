//import 'package:bravassapp/model/Profile.dart';
import 'dart:convert';

import 'package:bravassapp/pagesMahasiswa/model/Mahasiswa.dart';
import 'package:http/http.dart' show Client;

class SimpleAPI{
//  final String baseUrl="http://api.bengkelrobot.net:8001";
  Client client = Client();

  Future<List<Datum>> getMahasiswa() async {
    final response = await client.get("http://192.168.11.123:8088/api/v1/testapi/mahasiswa");
//    final response = await client.get("http://192.168.43.172:8088/api/v1/testapi/mahasiswa");
//      print(response.body);
    if(response.statusCode == 200){
      final result  = json.decode(response.body);
      Iterable list = result['data'];
      return list.map((model) => Datum.fromJson(model)).toList();
    } else{
      throw Exception('Failed Load Data');
    }
  }

  Future<bool> createMahasiswa(Datum data) async{
    final response = await client.post("http://192.168.11.123:8088/api/v1/testapi/mahasiswa",
//    final response = await client.post("http://192.168.43.172:8088/api/v1/testapi/mahasiswa",
        headers: {"content-type": "application/json"},
        body: mahasiswaToJson(data)
    );

    if(response.statusCode== 201){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMahasiswa(Datum data) async{
    final response = await client.put("http://192.168.11.123:8088/api/v1/testapi/mahasiswa/${data.npm}",
//    final response = await client.put("http://192.168.43.172:8088/api/v1/testapi/mahasiswa/${data.npm}",
        headers: {"content-type": "application/json"},
        body: mahasiswaToJson(data)
    );

    if(response.statusCode== 201){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMahasiswa(String npm) async{
    final response = await client.delete("http://192.168.11.123:8088/api/v1/testapi/mahasiswa/$npm",
//    final response = await client.delete("http://192.168.43.172:8088/api/v1/testapi/mahasiswa/$npm",
      headers: {"content-type": "application/json/"},
    );

    if(response.statusCode == 200){
      return true;
    } else {
      print("gagal");
    }
  }
}