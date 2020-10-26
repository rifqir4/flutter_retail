import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/services/database.dart';

class FormPelanggan extends StatefulWidget {
  final dynamic addPelanggan;
  FormPelanggan(this.addPelanggan);
  @override
  _FormPelangganState createState() => _FormPelangganState(addPelanggan);
}

class _FormPelangganState extends State<FormPelanggan> {
  dynamic addPelanggan;
  _FormPelangganState(this.addPelanggan);
  final _formkey = GlobalKey<FormState>();
  String _currNama;
  String _currAlamat;
  String _currTelp;
  String _currKet;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Tambah Data Pelanggan Baru", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              decoration:
                  textInputDecoration.copyWith(hintText: 'Nama Pelanggan'),
              onChanged: (val) => setState(() => _currNama = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration:
                  textInputDecoration.copyWith(hintText: 'Alamat Pelanggan'),
              onChanged: (val) => setState(() => _currAlamat = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Nomor Telp'),
              onChanged: (val) => setState(() => _currTelp = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Keterangan'),
              onChanged: (val) => setState(() => _currKet = val),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Tambah'),
              onPressed: () async {
                //addPelanggan(_currNama, _currAlamat, _currTelp, _currKet);
                await DatabaseService().addDataPelanggan(
                    _currNama, _currAlamat, _currTelp, _currKet);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
