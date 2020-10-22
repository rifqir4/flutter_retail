import 'package:flutter/material.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Belanja'),
      ),
    );
  }
}
