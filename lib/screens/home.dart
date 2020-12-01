import 'package:flutter/material.dart';
import 'package:retail_apps/models/menu.dart';
import 'package:retail_apps/widgets/menu_item.dart';

import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  bool connection = false;

  Future<void> _checkconnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      print("Connected");
      connection = true;
    } on SocketException catch (_) {
      print('not connected');
      connection = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkconnection();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(connection);
    return connection
        ? Scaffold(
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
                    child: Image.asset('assets/images/welcome.png'),
                  ),
                  Text(
                    'Toko Ada Serbaguna',
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
                              'Jalan Akik 10 Tlogomas',
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
                              '081334177037',
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
          )
        : Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Internet Connection'),
                    RaisedButton(
                      onPressed: () {
                        _checkconnection();
                      },
                      child: Text('Refresh'),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
