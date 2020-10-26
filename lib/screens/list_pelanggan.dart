import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/models/pelanggan.dart';
import 'package:retail_apps/services/database.dart';

class ListPelangganWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamProvider.value(
        value: DatabaseService().pelanggans,
        child: ListPelanggan(),
      ),
    );
  }
}

class ListPelanggan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final pelanggans = DATA_PELANGGANS;
    final pelanggans = Provider.of<List<Pelanggan>>(context);

    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: pelanggans.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(color: Colors.blue),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(pelanggans[index]);
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${pelanggans[index].nama}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
