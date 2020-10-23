import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/models/barang.dart';

class UpdateBarang extends StatefulWidget {
  final Barang barang;
  UpdateBarang(this.barang);
  @override
  _UpdateBarangState createState() => _UpdateBarangState(barang);
}

class _UpdateBarangState extends State<UpdateBarang> {
  final Barang barang;
  _UpdateBarangState(this.barang);
  final _formkey = GlobalKey<FormState>();
  String _currNama;
  String _currHarga;
  String _currTipe;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Edit Barang", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              initialValue: barang.nama,
              decoration: textInputDecoration.copyWith(hintText: 'Nama Barang'),
              onChanged: (val) => setState(() => _currNama = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: barang.harga,
              decoration: textInputDecoration.copyWith(hintText: 'Harga'),
              onChanged: (val) => setState(() => _currHarga = val),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currTipe ?? barang.tipe,
              items: <DropdownMenuItem>[
                DropdownMenuItem(value: 'Eceran', child: Text('Eceran')),
                DropdownMenuItem(value: 'Grosir', child: Text('Grosir')),
              ],
              onChanged: (val) {
                setState(() => _currTipe = val);
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Update'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
