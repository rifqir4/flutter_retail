import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/services/database.dart';
import 'package:retail_apps/widgets/barang/barang_item.dart';
import 'package:retail_apps/widgets/barang/form_barang.dart';
import 'package:retail_apps/widgets/barang/update_barang.dart';

import '../constant.dart';

class InputBarangWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamProvider.value(
        value: DatabaseService().barangs,
        child: InputBarang(),
      ),
    );
  }
}

class InputBarang extends StatefulWidget {
  @override
  _InputBarangState createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  //List<Barang> barangs = DATA_BARANGS;
  String search = '';

  @override
  Widget build(BuildContext context) {
    final barangs = Provider.of<List<Barang>>(context) ?? [];
    final tes = barangs
        .where((element) => element.nama.toLowerCase().contains(search))
        .toList();
    void _showInputPanel(dynamic addBarang) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: FormBarang(addBarang),
          );
        },
      );
    }

    void _updateBarang(String id, String nama, String harga, String tipe) {
      final index = barangs.indexWhere((element) => element.id == id);
      setState(() {
        barangs[index].nama = nama;
        barangs[index].harga = harga;
        barangs[index].tipe = tipe;
      });
      print(nama);
    }

    void _showUpdatePanel(Barang barang) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: UpdateBarang(barang, _updateBarang),
          );
        },
      );
    }

    void _deleteBarang(String id) {
      setState(() {
        barangs.removeWhere((element) => element.id == id);
      });
    }

    void _addBarang(String nama, String harga, String tipe) {
      print('kuda');
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      String id = randomNumber.toString();
      Barang baru =
          Barang(id: id, nama: nama, harga: harga, tipe: tipe, image: 'asdasd');
      setState(() {
        barangs.add(baru);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Input Barang'),
          backgroundColor: Colors.white,
          actions: [
            FlatButton.icon(
              onPressed: () => _showInputPanel(_addBarang),
              icon: Icon(Icons.add),
              label: Text('Tambah'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: textSearchDecoration.copyWith(hintText: 'Search'),
                onChanged: (val) => setState(() => search = val),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: tes.length,
                  itemBuilder: (contex, index) =>
                      BarangItem(tes[index], _deleteBarang, _showUpdatePanel),
                ),
              )
            ],
          ),
        ));
  }
}
