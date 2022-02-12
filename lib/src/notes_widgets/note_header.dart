import 'package:companion/model/app_styles_light.dart';
import 'package:flutter/material.dart';

class NoteHeader extends StatefulWidget {
  NoteHeader({Key? key}) : super(key: key);

  @override
  _NoteHeaderState createState() => _NoteHeaderState();
}

class _NoteHeaderState extends State<NoteHeader> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Notes', style: title 
    );
  }
}