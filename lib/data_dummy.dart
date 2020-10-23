import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/models/pelanggan.dart';

List<Pelanggan> DATA_PELANGGANS = [
  Pelanggan(
      id: '123',
      nama: 'Rifqi Radifan',
      alamat: 'Jl. Ikan Piranha Atas',
      telp: '081334177037',
      keterangan: 'null'),
  Pelanggan(
      id: '213',
      nama: 'Putri Harviana',
      alamat: 'Jl. Coklat Bunga',
      telp: '08123144121',
      keterangan: 'null')
];

List<Barang> DATA_BARANGS = [
  Barang(
      id: 'asda',
      nama: 'Aqua Galon',
      harga: '25000',
      tipe: 'Eceran',
      image: 'asdada'),
  Barang(
      id: 'asdas',
      nama: 'Aqua Sachet',
      harga: '5000',
      tipe: 'Eceran',
      image: 'asdada'),
];
