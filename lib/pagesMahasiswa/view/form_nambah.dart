import 'package:bravassapp/pages/dashboard.dart';
import 'package:bravassapp/pagesMahasiswa/model/Mahasiswa.dart';
import 'package:bravassapp/pagesMahasiswa/service/simpleAPI.dart';
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormNambah extends StatefulWidget {
  Datum mahasiswa;

  FormNambah({this.mahasiswa});

  @override
  _FormNambahState createState() => _FormNambahState();
}

class _FormNambahState extends State<FormNambah> {
  bool _isLoading = false;

  SimpleAPI _apiService = SimpleAPI();
  bool _isFieldNamaValid;
  bool _isFieldNpmValid;

  TextEditingController _controllerNpm = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.mahasiswa != null) {
      _isFieldNpmValid = true;
      _controllerNpm.text = widget.mahasiswa.npm;

      _isFieldNamaValid = true;
      _controllerNama.text = widget.mahasiswa.nama;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: warnaItem,
        title: Text(
          widget.mahasiswa == null ? "Form Tambah" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//                _buildTextFieldNpm(),
                TextField(
                  controller: _controllerNpm,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Npm",
                    errorText: _isFieldNpmValid == null || _isFieldNpmValid
                        ? null
                        : "Npm is required",
                  ),
                  onChanged: (value) {
                    bool isFieldValid = value.trim().isNotEmpty;
                    if (isFieldValid != _isFieldNpmValid) {
                      setState(() => _isFieldNpmValid = isFieldValid);
                    }
                  },
                ),
                _buildTextFieldNama(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.mahasiswa == null
                          ? "Submit".toUpperCase()
                          : "Update Data".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_isFieldNamaValid == null ||
                          _isFieldNpmValid == null ||
                          !_isFieldNamaValid ||
                          !_isFieldNpmValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Field Can't Blank"),
                          ),
                        );
                        return;
                      }

                      setState(() => _isLoading = true);
                      String npm = _controllerNpm.text.toString();
                      String nama = _controllerNama.text.toString();

                      Datum mahasiswa = Datum(npm: npm, nama: nama);

                      if (widget.mahasiswa == null) {
                        _apiService
                            .createMahasiswa(mahasiswa)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submited Data Sukses!"),
                            ));
                          }
                        });
                      } else {
                        _apiService
                            .updateMahasiswa(mahasiswa)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Ubah Data Sukses!"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.orange[600],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldNama() {
    return TextField(
      controller: _controllerNama,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Name",
        errorText: _isFieldNamaValid == null || _isFieldNamaValid
            ? null
            : "Full Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNamaValid) {
          setState(() => _isFieldNamaValid = isFieldValid);
        }
      },
    );
  }

//  Widget _buildTextFieldNpm(){
//    return TextField(
//      controller: _controllerNpm,
//      keyboardType: TextInputType.number,
//      decoration: InputDecoration(
//        labelText: "Npm",
//        errorText: _isFieldNpmValid == null || _isFieldNpmValid
//            ? null : "Npm is required",
//      ),
//      onChanged: (value){
//        bool isFieldValid = value.trim().isNotEmpty;
//        if (isFieldValid != _isFieldNpmValid){
//          setState(() => _isFieldNpmValid = isFieldValid);
//        }
//      },
//    );
//  }

}
