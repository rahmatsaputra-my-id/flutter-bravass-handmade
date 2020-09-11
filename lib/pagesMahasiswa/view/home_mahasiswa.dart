import 'package:bravassapp/pagesMahasiswa/service/simpleAPI.dart';
import 'package:flutter/material.dart';
import 'package:bravassapp/pagesMahasiswa/view/form_nambah.dart';
import 'package:bravassapp/pagesMahasiswa/model/Mahasiswa.dart';

class HomeMahasiswa extends StatefulWidget {
  @override
  _HomeMahasiswaState createState() => _HomeMahasiswaState();
}

class _HomeMahasiswaState extends State<HomeMahasiswa> {
  BuildContext context;
  SimpleAPI simpleAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    simpleAPI = SimpleAPI();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: simpleAPI.getMahasiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Ada Yang Salah dengan Pesan: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Datum> Mahasiswas = snapshot.data;
            return _buildListView(Mahasiswas);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Datum> Mahasiswaz) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: new ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Datum mahasiswa = Mahasiswaz[index];

          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(mahasiswa.npm ?? 'NPM',
                        style: Theme.of(context).textTheme.title),
                    new Text(mahasiswa.nama ?? 'Nama'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text(
                                        "ingin menghapus delete data ${mahasiswa.nama}?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Yess"),
                                        onPressed: () {
                                          Navigator.pop(context);
//                                        print(mahasiswa.npm);
                                          simpleAPI
                                              .deleteMahasiswa(mahasiswa.npm)
                                              .then((isSuccess) {
//                                            print('cek bro');
                                            print(isSuccess.toString());
                                            if (isSuccess) {
//                                                    print("berhasil");
                                              setState(() {});
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Delete Data Berhasil"),
                                              ));
                                            } else {
                                              print("tidak berhasil");
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text("Delete Data Gagal!"),
                                              ));
                                            }
                                          });
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FormNambah(mahasiswa: mahasiswa);
                            }));
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: Mahasiswaz.length,
      ),
    );
  }
}
