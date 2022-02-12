import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  Goals({Key? key}) : super(key: key);

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('GOALS', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}