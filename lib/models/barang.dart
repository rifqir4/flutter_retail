import 'package:flutter/foundation.dart';

class Barang {
  final String id;
  final String nama;
  final String tipe;
  final String harga;
  final String image;
  final int jumlah;

  Barang(
      {@required this.id,
      @required this.nama,
      @required this.harga,
      @required this.tipe,
      @required this.image,
      this.jumlah});
}
