import 'package:flutter/material.dart';
import 'package:retail_apps/screens/checkout.dart';
import 'package:retail_apps/screens/home.dart';
import 'package:retail_apps/screens/input_barang.dart';
import 'package:retail_apps/screens/input_data.dart';
import 'package:retail_apps/screens/kasir.dart';
import 'package:retail_apps/screens/list_barang.dart';
import 'package:retail_apps/screens/list_pelanggan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        accentColor: Colors.blue[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/kasir': (context) => Kasir(),
        '/input-barang': (context) => InputBarangWrapper(),
        '/input-data': (context) => InputDataWrapper(),
        '/checkout': (context) => Checkout(),
        '/list-barang': (context) => ListBarangWrapper(),
        '/list-pelanggan': (context) => ListPelangganWrapper()
      },
    );
  }
}
