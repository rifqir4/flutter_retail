import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/services/database.dart';

class UpdateBarang extends StatefulWidget {
  final Barang barang;
  final update;
  UpdateBarang(this.barang, this.update);
  @override
  _UpdateBarangState createState() => _UpdateBarangState(barang, update);
}

class _UpdateBarangState extends State<UpdateBarang> {
  final Barang barang;
  dynamic update;
  _UpdateBarangState(this.barang, this.update);
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
              onPressed: () async {
                // update(barang.id, _currNama ?? barang.nama,
                //     _currHarga ?? barang.harga, _currTipe ?? barang.tipe);
                await DatabaseService().updateDataBarang(
                    barang.id,
                    _currNama ?? barang.nama,
                    _currHarga ?? barang.harga,
                    _currTipe ?? barang.tipe);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
