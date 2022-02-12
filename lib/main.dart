import 'package:companion/hive/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hive/helpers.dart';
import 'src/home.dart';
import 'src/pages/notes.dart';
import 'src/pages/sidepages/addnote.dart';
import 'src/pages/start/login.dart';
import 'src/pages/start/onboarding_page.dart';

bool? seenOnboard;

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
Hive.registerAdapter(NoteAdapter());
await Hive.openBox<Note>('notes');
SharedPreferences pref = await SharedPreferences.getInstance();
seenOnboard = pref.getBool('seenOnboard') ?? false; //if null, set to false
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Berlitz Paylog',
        home: seenOnboard == true ? Home() : OnBoardingPage(),
        routes: {
          'login': (context) => Login(),
          'onboarding': (context) => OnBoardingPage(),
          'home' : (context) => Home(),
          'notes' : (context) => Notes(),
          'addNote' : (context) => AddNote(onClickedDone: NoteHelper.addNote)
        },
    );
  }
}