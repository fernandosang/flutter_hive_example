import 'package:flutter/material.dart';
import 'size_configs.dart';

Color kPrimaryColor = Color(0xff045CC8);
Color kSecondaryColor = Color(0xffffd485);
Color kThirdColor = Color(0xff78e3fd);
Color kFourthColor = Color(0xffd1f5ff);
Color kFifthColor = Color(0xffe7f0f6);

final kTitle = TextStyle(
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 9,
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
);

final kBodyText1 = TextStyle(
  color: Colors.grey.shade800,
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 5,
  fontWeight: FontWeight.w400
);

final kBodyText2 = TextStyle(
  color: Colors.grey.shade800,
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 5,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
  color: Colors.white,
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 5,
  fontWeight: FontWeight.bold,
);

