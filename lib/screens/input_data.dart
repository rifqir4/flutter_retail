import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/constant.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/models/pelanggan.dart';
import 'package:retail_apps/services/database.dart';
import 'package:retail_apps/widgets/pelanggan/form_pelanggan.dart';
import 'package:retail_apps/widgets/pelanggan/pelanggan_item.dart';
import 'package:retail_apps/widgets/pelanggan/update_pelanggan.dart';

class InputDataWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamProvider.value(
        value: DatabaseService().pelanggans,
        child: InputData(),
      ),
    );
  }
}

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  //List<Pelanggan> pelanggans = DATA_PELANGGANS;
  String search = '';

  @override
  Widget build(BuildContext context) {
    final pelanggans = Provider.of<List<Pelanggan>>(context) ?? [];
    final tes = pelanggans
        .where((element) => element.nama.toLowerCase().contains(search))
        .toList();
    void _showInputPanel(dynamic addPelanggan) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
            child: FormPelanggan(addPelanggan),
          );
        },
      );
    }

    void _updatePelanggan(
        String id, String nama, String alamat, String telp, String ket) {
      final index = pelanggans.indexWhere((element) => element.id == id);
      setState(() {
        pelanggans[index].nama = nama;
        pelanggans[index].alamat = alamat;
        pelanggans[index].telp = telp;
        pelanggans[index].keterangan = ket;
      });
    }

    void _showUpdatePanel(Pelanggan pelanggan) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: UpdatePelanggan(pelanggan, _updatePelanggan),
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
            FlatButton.icon(
              onPressed: () => _showInputPanel(_addPelanggan),
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
                  itemBuilder: (contex, index) => PelangganItem(
                      tes[index], _deletePelanggan, _showUpdatePanel),
                ),
              )
            ],
          ),
        ));
  }
}
