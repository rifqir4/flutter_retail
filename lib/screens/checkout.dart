import 'package:flutter/material.dart';
import 'package:retail_apps/models/barang.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Barang> keranjang = ModalRoute.of(context).settings.arguments;
    print(keranjang);
    return Container(
      child: Text(keranjang[0].nama),
    );
  }
}
