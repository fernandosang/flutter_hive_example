import 'package:companion/model/app_styles_light.dart';
import 'package:companion/model/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class WelcomeBoard extends StatelessWidget {
  WelcomeBoard({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: unfocusedSubtitle,
              textAlign: TextAlign.left,
            ),
            Text(username, style: title, textAlign: TextAlign.left),
          ],
        ),
        SizedBox(width: sizeH * 3),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 4),
                )
              ],
              shape: BoxShape.circle,
              border: Border.all(color: thirdColor, width: 3)),
          child: FluttermojiCircleAvatar(
              radius: 23, backgroundColor: Colors.blueGrey),
        ),
      ],
    );
  }
}
