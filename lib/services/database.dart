import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/models/pelanggan.dart';

class DatabaseService {
  final CollectionReference barangCollection =
      Firestore.instance.collection('barang');
  final CollectionReference pelangganCollection =
      Firestore.instance.collection('pelanggan');

  List<Barang> _barangListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Barang(
        id: doc.documentID,
        nama: doc.data['nama'] ?? '',
        harga: doc.data['harga'] ?? '0',
        tipe: doc.data['tipe'] ?? '',
        image: doc.data['image'] ?? '',
        jumlah: doc.data['jumlah'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Barang>> get barangs {
    return barangCollection.snapshots().map(_barangListFromSnapshot);
  }

  //add data barang
  Future addDataBarang(
      String nama, String harga, String tipe, String image, int jumlah) async {
    return await barangCollection.add({
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'image': image,
      'jumlah': jumlah
    });
  }

  Future deleteDataBarang(String id) async {
    await barangCollection.document(id).delete();
  }

  Future updateDataBarang(
      String id, String nama, String harga, String tipe) async {
    return await barangCollection
        .document(id)
        .setData({'nama': nama, 'harga': harga, 'tipe': tipe});
  }

  List<Pelanggan> _pelangganListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pelanggan(
          id: doc.documentID,
          nama: doc.data['nama'] ?? '',
          alamat: doc.data['alamat'] ?? '',
          telp: doc.data['telp'] ?? '',
          keterangan: doc.data['keterangan'] ?? '');
    }).toList();
  }

  Stream<List<Pelanggan>> get pelanggans {
    return pelangganCollection.snapshots().map(_pelangganListFromSnapshot);
  }

  Future addDataPelanggan(
      String nama, String alamat, String telp, String keterangan) async {
    return await pelangganCollection.add({
      'nama': nama,
      'alamat': alamat,
      'telp': telp,
      'keterangan': keterangan,
    });
  }

  Future deleteDataPelanggan(String id) async {
    await pelangganCollection.document(id).delete();
  }

  Future updateDataPelanggan(String id, String nama, String alamat, String telp,
      String keterangan) async {
    return await pelangganCollection.document(id).setData({
      'nama': nama,
      'alamat': alamat,
      'telp': telp,
      'keterangan': keterangan
    });
  }
}
