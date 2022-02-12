import 'package:companion/model/app_styles_light.dart';
import 'package:companion/model/size_configs.dart';
import 'package:companion/src/home_page_widgets/welcome_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:companion/src/home_page_widgets/balance.dart';
import 'package:companion/src/home_page_widgets/quick_actions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: sizeV * 7),
            child: WelcomeBoard(username: username),
          ),
          Balance(),
          SizedBox(height: sizeV * 7),
          Padding(
            padding: EdgeInsets.only(left: sizeH * 7),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Overviews',
                style: title,
              ),
            ),
          ),
          SizedBox(height: sizeV * 3),
          QuickActions(),
        ])));
  }

  void getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username')!;
    setState(() {});
  }
}
