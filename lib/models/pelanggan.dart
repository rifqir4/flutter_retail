import 'package:flutter/foundation.dart';

class Pelanggan {
  final String id;
  final String nama;
  final String alamat;
  final String keterangan;

  Pelanggan(
      {@required this.id,
      @required this.nama,
      @required this.alamat,
      @required this.keterangan});
}
