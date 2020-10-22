import 'package:flutter/material.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/screens/checkout.dart';
import 'package:retail_apps/widgets/belanja_item.dart';

class Kasir extends StatefulWidget {
  @override
  _KasirState createState() => _KasirState();
}

class _KasirState extends State<Kasir> {
  List<Barang> keranjang = [
    Barang(
        id: '23123',
        nama: 'Aqua Galon',
        harga: '25000',
        tipe: 'Grosir',
        image: 'gambar'),
    Barang(
        id: '231231',
        nama: 'Beng Beng',
        harga: '5000',
        tipe: 'Grosir',
        image: 'gambar')
  ];

  int total = 0;

  void addBarang(Barang barang) {
    setState(() {
      keranjang.add(barang);
      total = total + (int.parse(barang.harga));
    });
  }

  void deleteBarang(String id) {
    Barang barang = keranjang.where((element) => element.id == id).toList()[0];

    setState(() {
      total = total - int.parse(barang.harga);
      keranjang.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  Widget buildContainerPelanggan(String title, String ket, Icon icon) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue[200],
            child: icon,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              ket,
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    buildContainerPelanggan(
                        'Alamat',
                        'Jalan Jalan',
                        Icon(
                          Icons.place_outlined,
                          color: Colors.white,
                        )),
                    SizedBox(height: 12),
                    buildContainerPelanggan(
                        'Alamat',
                        'Jalan Jalan',
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                addBarang(Barang(
                    id: '12321',
                    nama: 'Barang Baru',
                    harga: "30000",
                    tipe: 'Eceran',
                    image: 'image'));
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Barang Baru'),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: keranjang.length,
                        itemBuilder: (context, index) =>
                            BelanjaItem(keranjang[index], deleteBarang),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Total:'), Text('Rp. $total')],
                      ),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/checkout', arguments: keranjang);
                        },
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: Text('Selesaikan Pembelanjaan'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
