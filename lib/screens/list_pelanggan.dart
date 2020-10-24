import 'package:flutter/material.dart';
import 'package:retail_apps/data_dummy.dart';

class ListPelanggan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pelanggans = DATA_PELANGGANS;

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
