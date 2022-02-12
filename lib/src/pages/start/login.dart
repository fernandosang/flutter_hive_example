import 'package:animations/animations.dart';
import 'package:companion/model/onboarding_app_styles.dart';
import 'package:companion/src/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/size_configs.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool isButtonActive = false;
  late TextEditingController controller;
  late FluttermojiController _fluttermojiController;

  @override
  void initState() {
    super.initState();
    Get.put(FluttermojiController());
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    _fluttermojiController = Get.find<FluttermojiController>();

    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: sizeV * 8),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
                controller: controller,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  hintText: 'Your name',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: sizeV * 2),
              Container(
                  height: 155,
                  width: 155,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4)),
                  child: FluttermojiCircleAvatar()),
              Stack(alignment: Alignment.center, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, sizeV * 4, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    width: sizeH * 100,
                    height: sizeV * 60,
                  ),
                ),
                Positioned(
                  top: 1,
                  child: FluttermojiCustomizer(
                    scaffoldWidth: sizeH * 95,
                    scaffoldHeight: sizeV * 50,
                    outerTitleText: '',
                    showSaveWidget: false,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeH * 32, vertical: sizeV * 0.3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text('Done'),
                    onPressed: isButtonActive
                        ? () {
                            saveUsername(controller.text);
                            setState(() {
                              _fluttermojiController.setFluttermoji();
                            });
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => Home(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    SharedAxisTransition(
                                        animation: anim,
                                        secondaryAnimation: a2,
                                        transitionType:
                                            SharedAxisTransitionType.horizontal,
                                        child: child),
                                transitionDuration: Duration(milliseconds: 500),
                              ),
                            );
                          }
                        : null,
                  ),
                ),
              ])
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> saveUsername(username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
  }
}
