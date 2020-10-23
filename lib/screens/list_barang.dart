import 'package:flutter/material.dart';
import 'package:retail_apps/data_dummy.dart';

class ListBarang extends StatefulWidget {
  @override
  _ListBarangState createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  final barangs = DATA_BARANGS;

  int jumlah = 0;

  _createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (contex) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text('Berapa ?'),
          content: Row(
            children: <Widget>[
              InkWell(
                onTap: () => setState(() => jumlah = jumlah + 1),
                child: Text('+'),
              ),
              Text('$jumlah'),
              InkWell(
                onTap: () => setState(() => jumlah = jumlah - 1),
                child: Text('-'),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              elevation: 5,
              child: Text('Mantap'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: barangs.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              // print(barangs[index]);
              // Navigator.of(context).pop(barangs[index]);
              _createAlertDialog(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    barangs[index].nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Rp. ${barangs[index].harga}'),
                      Text('Tipe: ${barangs[index].tipe}')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
