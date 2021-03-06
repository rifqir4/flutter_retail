import 'package:flutter/material.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/services/database.dart';

class BarangItem extends StatelessWidget {
  final Barang barang;
  final dynamic delete;
  final dynamic showUpdate;
  BarangItem(this.barang, this.delete, this.showUpdate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(barang.nama),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.green[500]),
                    Text(' ${barang.tipe}',
                        style: TextStyle(color: Colors.green[500]))
                  ],
                ),
              ],
            ),
            Text('Rp. ${barang.harga}'),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.green[100],
                    child: InkWell(
                      onTap: () {
                        showUpdate(barang);
                      },
                      child: Icon(Icons.edit_outlined),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.red[100],
                    child: InkWell(
                      onTap: () {
                        //delete(barang.id);
                        DatabaseService().deleteDataBarang(barang.id);
                      },
                      child: Icon(Icons.delete_outline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
