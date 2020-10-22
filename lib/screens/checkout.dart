import 'package:flutter/material.dart';
import 'package:retail_apps/models/barang.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Barang> keranjang = ModalRoute.of(context).settings.arguments;
    print(keranjang);
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: keranjang.length,
            itemBuilder: (context, index) => Text('${keranjang[index].nama}')),
      ),
    );
  }
}
