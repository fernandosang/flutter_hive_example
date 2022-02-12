import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HISTORY', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
