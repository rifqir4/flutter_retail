import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/services/database.dart';
import 'package:retail_apps/widgets/barang/form_barang.dart';
import 'package:retail_apps/widgets/barang/update_barang.dart';

class GetKategori extends StatelessWidget {
  Function addBarang;
  GetKategori(this.addBarang);
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: DatabaseService().kategoris,
      child: FormBarang(addBarang),
    );
  }
}

class GetKategoriUpdate extends StatelessWidget {
  final Barang barang;
  final update;
  GetKategoriUpdate(this.barang, this.update);
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: DatabaseService().kategoris,
      child: UpdateBarang(barang, update),
    );
  }
}
