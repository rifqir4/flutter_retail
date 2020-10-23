import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';

class FormBarang extends StatefulWidget {
  final dynamic addBarang;
  FormBarang(this.addBarang);
  @override
  _FormBarangState createState() => _FormBarangState(addBarang);
}

class _FormBarangState extends State<FormBarang> {
  dynamic addBarang;
  _FormBarangState(this.addBarang);
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
            Text("Tambah Barang Baru", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Nama Barang'),
              onChanged: (val) => setState(() => _currNama = val),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Harga'),
              onChanged: (val) => setState(() => _currHarga = val),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currTipe ?? 'Eceran',
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
              child: Text('Tambah'),
              onPressed: () {
                addBarang(_currNama, _currHarga, _currTipe ?? 'Eceran');
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
