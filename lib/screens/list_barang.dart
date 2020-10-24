import 'package:flutter/material.dart';
import 'package:retail_apps/data_dummy.dart';
import 'package:retail_apps/screens/kasir.dart';

class ListBarang extends StatefulWidget {
  @override
  _ListBarangState createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  final barangs = DATA_BARANGS;

  int jumlah = 1;

  _createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (contex) => StatefulBuilder(builder: (context, setState) {
        _countHandle(bool stat) {
          if (stat) {
            setState(() => jumlah = jumlah + 1);
          } else if (jumlah != 0) {
            setState(() => jumlah = jumlah - 1);
          }
        }

        return AlertDialog(
          title: Text('Berapa ?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => _countHandle(true),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.add),
                ),
              ),
              Text('$jumlah'),
              InkWell(
                onTap: () => _countHandle(false),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              elevation: 5,
              child: Text('Mantap'),
              onPressed: () {
                String tes = 'haihai';
                Navigator.of(context).pop(tes);
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
            onTap: () async {
              // print(barangs[index]);
              // Navigator.of(context).pop(barangs[index]);
              dynamic poo = await _createAlertDialog(context);
              setState(() {
                barangs[index].jumlah = jumlah;
              });
              Navigator.of(context).pop(barangs[index]);
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
