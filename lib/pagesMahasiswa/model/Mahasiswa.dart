import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Datum data) => json.encode(data.toJson());

class Mahasiswa {
  String err;
  String message;
  String cursor;
  List<Datum> data;
  dynamic messageData;

  Mahasiswa({
    this.err,
    this.message,
    this.cursor,
    this.data,
    this.messageData,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
    err: json["err"],
    message: json["message"],
    cursor: json["cursor"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    messageData: json["message_data"],
  );

  Map<String, dynamic> toJson() => {
    "err": err,
    "message": message,
    "cursor": cursor,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message_data": messageData,
  };
}

class Datum {
  String npm;
  String nama;

  Datum({
    this.npm,
    this.nama,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    npm: json["npm"],
    nama: json["nama"],
  );

  Map<String, dynamic> toJson() => {
    "npm": npm,
    "nama": nama,
  };
}
