import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/models/kategori.dart';
import 'package:retail_apps/services/database.dart';

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
  String _currKategori;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> _buildDropdownItem(snapshot) {
      List<DropdownMenuItem> kategori = [];
      List<Kategori> kategoris = snapshot.data;
      for (var i = 0; i < kategoris.length; i++) {
        kategori.add(DropdownMenuItem(
            value: kategoris[i].id, child: Text(kategoris[i].nama)));
      }
      return kategori;
    }

    return Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Tambah Barang Baru", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  labelText: 'Nama Barang',
                  suffixIcon: Icon(
                    Icons.featured_play_list_outlined,
                    color: Colors.black,
                  )),
              onChanged: (val) => _currNama = val,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  labelText: 'Harga',
                  suffixIcon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.black,
                  )),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (val) => _currHarga = val,
            ),
            SizedBox(height: 10),
            if (_checkbox)
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    labelText: 'Kategori',
                    suffixIcon: Icon(
                      Icons.category_outlined,
                      color: Colors.black,
                    )),
                onChanged: (val) => _currKategori = val,
              ),
            if (!_checkbox)
              StreamBuilder(
                stream: DatabaseService().kategoris,
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Loading'),
                          )
                        : DropdownButtonFormField(
                            decoration: textInputDecoration,
                            value: _currKategori ?? snapshot.data[0].id,
                            items: _buildDropdownItem(snapshot),
                            onChanged: (val) {
                              setState(() => _currTipe = val);
                            },
                          ),
              ),
            Row(
              children: [
                Checkbox(
                    value: _checkbox,
                    onChanged: (val) {
                      setState(() => _checkbox = val);
                      _currKategori = null;
                    }),
                Text('Tambah Kategori Baru?'),
              ],
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
                //addBarang(_currNama, _currHarga, _currTipe ?? 'Eceran');
                DatabaseService().addDataBarang(_currNama, _currHarga,
                    _currTipe, _currKategori, 'adada', 0, _checkbox);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
