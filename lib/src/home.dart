import 'package:companion/model/app_styles_light.dart';
import 'package:companion/src/pages/history.dart';
import 'package:companion/src/pages/home_page.dart';
import 'package:companion/src/pages/notes.dart';
import 'package:companion/src/pages/goals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    History(),
    Goals(),
    Notes(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: actionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 100,
        child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Home();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: currentTab == 0 ? primaryColor : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontFamily: 'Lexa',
                              color:
                                  currentTab == 0 ? primaryColor : Colors.grey,
                            ),
                          )
                        ],
                      )),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = History();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history_outlined,
                            color: currentTab == 1 ? primaryColor : Colors.grey,
                          ),
                          Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'Lexa',
                              color:
                                  currentTab == 1 ? primaryColor : Colors.grey,
                            ),
                          )
                        ],
                      ))
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Goals();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.flag_outlined,
                              color:
                                  currentTab == 2 ? primaryColor : Colors.grey,
                            ),
                            Text(
                              'Goals',
                              style: TextStyle(
                                fontFamily: 'Lexa',
                                color: currentTab == 2
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Notes();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notes_outlined,
                              color:
                                  currentTab == 3 ? primaryColor : Colors.grey,
                            ),
                            Text(
                              'Notes',
                              style: TextStyle(
                                fontFamily: 'Lexa',
                                color: currentTab == 3
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }

  FloatingActionButton actionButton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        onPressed: () {
          if (currentTab == 0) {
            print('Home');
          } else if (currentTab == 1) {
            print('History');
          } else if (currentTab == 2) {
            print('Goals');
          } else if (currentTab == 3) {
            print('Notes');
          }
          ;
        });
  }
}
