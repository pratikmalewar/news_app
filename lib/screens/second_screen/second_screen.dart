import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String nameData;
  const SecondScreen({super.key,required this.nameData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Second Screen',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
