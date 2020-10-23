import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/widgets/barang/barang_item.dart';
import 'package:retail_apps/widgets/barang/form_barang.dart';
import 'package:retail_apps/widgets/barang/update_barang.dart';

class InputBarang extends StatefulWidget {
  @override
  _InputBarangState createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  List<Barang> barangs = DATA_BARANGS;

  @override
  Widget build(BuildContext context) {
    void _showInputPanel(dynamic addBarang) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: FormBarang(addBarang),
          );
        },
      );
    }

    void _showUpdatePanel(Barang barang) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: UpdateBarang(barang),
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
            FlatButton(
              onPressed: () => _showInputPanel(_addBarang),
              child: Text(
                'tekan',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text('Search'),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: barangs.length,
                  itemBuilder: (contex, index) => BarangItem(
                      barangs[index], _deleteBarang, _showUpdatePanel),
                ),
              )
            ],
          ),
        ));
  }
}
