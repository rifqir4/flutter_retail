import 'package:flutter/material.dart';

class InputBarang extends StatefulWidget {
  @override
  _InputBarangState createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Barang'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Belanja'),
      ),
    );
  }
}
