import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/models/pelanggan.dart';

class UpdatePelanggan extends StatefulWidget {
  final Pelanggan pelanggan;
  UpdatePelanggan(this.pelanggan);
  @override
  _UpdatePelangganState createState() => _UpdatePelangganState(pelanggan);
}

class _UpdatePelangganState extends State<UpdatePelanggan> {
  final Pelanggan pelanggan;
  _UpdatePelangganState(this.pelanggan);
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
            Text("Edit Data Pelanggan", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              initialValue: pelanggan.nama,
              decoration:
                  textInputDecoration.copyWith(hintText: 'Nama Pelanggan'),
              onChanged: (val) => setState(() => _currNama = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: pelanggan.alamat,
              decoration:
                  textInputDecoration.copyWith(hintText: 'Alamat Pelanggan'),
              onChanged: (val) => setState(() => _currAlamat = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: pelanggan.telp,
              decoration: textInputDecoration.copyWith(hintText: 'Nomor Telp'),
              onChanged: (val) => setState(() => _currTelp = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: pelanggan.keterangan,
              decoration: textInputDecoration.copyWith(hintText: 'Keterangan'),
              onChanged: (val) => setState(() => _currKet = val),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Tambah'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
