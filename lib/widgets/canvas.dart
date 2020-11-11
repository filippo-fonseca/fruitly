import 'package:flutter/material.dart';

class Canvas extends StatelessWidget {
  final String personName;

  const Canvas({Key key, this.personName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Text(
        personName,
        style: TextStyle(fontSize: 30.0),
      )),
    );
  }
}
