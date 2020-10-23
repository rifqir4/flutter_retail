import 'package:flutter/material.dart';
import 'package:retail_apps/models/barang.dart';
import 'package:retail_apps/models/pelanggan.dart';
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
        image: 'gambar',
        jumlah: 2),
    Barang(
        id: '231231',
        nama: 'Beng Beng',
        harga: '5000',
        tipe: 'Grosir',
        image: 'gambar',
        jumlah: 3)
  ];
  Pelanggan pelanggan = Pelanggan(
      id: '123',
      nama: 'Rifqi Radifan',
      alamat: 'Jl. Ikan Piranha Atas',
      telp: '081334177037',
      keterangan: 'Didalem');
  int total = 65000;

  void addBarang(Barang barang) {
    setState(() {
      keranjang.add(barang);
      // total = total + (int.parse(barang.harga) * barang.jumlah);
    });
  }

  void deleteBarang(String id) {
    Barang barang = keranjang.where((element) => element.id == id).toList()[0];

    setState(() {
      total = total - int.parse(barang.harga) * barang.jumlah;
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
            Container(
              width: 200,
              child: Text(
                ket,
                style: TextStyle(color: Colors.white),
              ),
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
                        'Keterangan',
                        'Pagar Hitam Biru asd asd asd as das',
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        )),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/list-barang'),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/list-barang')
                    .catchError((e) => print(e))
                    .then(
                  (newBarang) {
                    if (newBarang != null)
                      addBarang((newBarang as Barang) ?? []);
                  },
                );
              },
              color: Colors.green,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text('Tambah Barang Baru',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Expanded(
              flex: 1,
              child: Container(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Total:'), Text('Rp. $total')],
                      ),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/checkout',
                              arguments: {
                                'keranjang': keranjang,
                                'pelanggan': pelanggan,
                                'total': total
                              });
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
