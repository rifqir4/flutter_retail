import 'package:flutter/material.dart';
import 'package:retail_apps/models/menu.dart';
import 'package:retail_apps/widgets/menu_item.dart';

class Home extends StatelessWidget {
  final menu = [
    Menu(route: '/kasir', title: 'Kasir', image: 'assets/images/giveaway.png'),
    Menu(
        route: '/input-barang',
        title: 'Input Barang',
        image: 'assets/images/newsletter.png'),
    Menu(
        route: '/input-data',
        title: 'Input Data Pelanggan',
        image: 'assets/images/data.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beranda',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: Image.asset('assets/images/logo.png'),
            ),
            Text(
              'Toko Solo Makmur',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.place_outlined),
                      SizedBox(width: 6),
                      Text(
                        'Jl. Kasuari Raya no. 256',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 6),
                      Text(
                        'Perumnas 1, Kayuringin Jaya',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 6),
                      Text(
                        'Bekasi Selatan, Kota Bekasi, 17144',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.phone_outlined),
                      SizedBox(width: 6),
                      Text(
                        '021-8868068',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) => MenuItem(
                      title: menu[index].title,
                      image: menu[index].image,
                      route: menu[index].route)),
            ),
          ],
        ),
      ),
    );
  }
}
