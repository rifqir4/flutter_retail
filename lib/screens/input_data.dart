import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/models/pelanggan.dart';
import 'package:retail_apps/widgets/pelanggan/form_pelanggan.dart';
import 'package:retail_apps/widgets/pelanggan/pelanggan_item.dart';
import 'package:retail_apps/widgets/pelanggan/update_pelanggan.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  List<Pelanggan> pelanggans = DATA_PELANGGANS;

  @override
  Widget build(BuildContext context) {
    void _showInputPanel(dynamic addPelanggan) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: FormPelanggan(addPelanggan),
          );
        },
      );
    }

    void _showUpdatePanel(Pelanggan pelanggan) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: UpdatePelanggan(pelanggan),
          );
        },
      );
    }

    void _deletePelanggan(String id) {
      setState(() {
        pelanggans.removeWhere((element) => element.id == id);
      });
    }

    void _addPelanggan(String nama, String alamat, String telp, String ket) {
      print('kuda');
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      String id = randomNumber.toString();
      Pelanggan baru = Pelanggan(
          id: id, nama: nama, alamat: alamat, telp: telp, keterangan: ket);
      setState(() {
        pelanggans.add(baru);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Input Data'),
          backgroundColor: Colors.white,
          actions: [
            FlatButton(
              onPressed: () => _showInputPanel(_addPelanggan),
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
              TextField(
                decoration: textSearchDecoration.copyWith(hintText: 'Search'),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: pelanggans.length,
                  itemBuilder: (contex, index) => PelangganItem(
                      pelanggans[index], _deletePelanggan, _showUpdatePanel),
                ),
              )
            ],
          ),
        ));
  }
}
