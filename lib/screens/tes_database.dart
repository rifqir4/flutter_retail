import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/services/database.dart';

class TesDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamProvider.value(
        value: DatabaseService().barangs,
        child: DataCu(),
      ),
    );
  }
}

class DataCu extends StatefulWidget {
  @override
  _DataCuState createState() => _DataCuState();
}

class _DataCuState extends State<DataCu> {
  @override
  Widget build(BuildContext context) {
    final barangs = Provider.of<List<Barang>>(context) ?? [];
    print(barangs);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView.builder(
            itemCount: barangs.length,
            itemBuilder: (context, index) => Text(barangs[index].nama)),
      ),
    );
  }
}
