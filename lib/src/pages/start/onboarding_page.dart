import 'package:flutter/material.dart';
import 'package:companion/model/onboard_data.dart';
import '../../../model/onboarding_app_styles.dart';
import '../../../main.dart';
import '../../../model/size_configs.dart';
import 'package:animations/animations.dart';
import 'package:companion/src/pages/start/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 200),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }

  setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
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
        body: Column(
              children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(sizeH * 80, sizeV * 4, sizeH * 5, 0),
              child: SkipButton(
                  name: 'Skip',
                  onPressed: () {
                    setSeenonboard();
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => Login(),
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
                  }),
            ),
          ]),
          Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(height: sizeV * 4),
                    Container(
                        height: sizeV * 30,
                        width: double.infinity,
                        child: Image.asset(
                          onboardingContents[index].image,
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          sizeH * 10, sizeH * 8, sizeH * 8, 0),
                      child: Text(
                        onboardingContents[index].title,
                        style: kTitle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          sizeH * 10, sizeH * 4, sizeH * 10, 0),
                      child: Text(onboardingContents[index].subtitle,
                          style: kBodyText1, textAlign: TextAlign.left),
                    ),
                    SizedBox(height: sizeV * 5),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPage == onboardingContents.length - 1
                    ? MyTextButton(
                        buttonName: 'Get Started',
                        onPressed: () {
                          setSeenonboard();
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => Login(),
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
                        },
                        bgColor: kPrimaryColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(sizeH * 10, 0, 0, 0),
                            child: Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                          ),
                          Container(
                            width: sizeH * 26.5,
                            height: sizeV * 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade800.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                bottomLeft: Radius.circular(28),
                              ),
                              color: kPrimaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                              child: NextButton(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )
              ],
            ),
        );
  }
}

class MyTextButton extends StatelessWidget {
  MyTextButton({
    Key? key,
    required this.onPressed,
    required this.buttonName,
    required this.bgColor,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  double sizeH = SizeConfig.blockSizeH!;
  double sizeV = SizeConfig.blockSizeV!;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: sizeV * 6,
        width: sizeH * 40,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade800.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: kBodyText3,
          ),
        ));
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.black12,
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              name,
              style: kBodyText2,
            )));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.black12,
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              name,
              style: kBodyText3,
            )));
  }
}
