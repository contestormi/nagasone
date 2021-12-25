import 'package:flutter/material.dart';

class ChipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Second Activity Screen',
            style: TextStyle(fontSize: 21),
          ),
        ),
      ),
    );
  }
}
