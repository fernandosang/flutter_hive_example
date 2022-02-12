import 'package:flutter/material.dart';
import 'size_configs.dart';

Color primaryColor = Color(0xFF0062ff);
Color secondaryColor = Color(0xFF89BBFE);
Color thirdColor = Color(0xFF4D485C);
Color fourthColor = Color(0xFFA09FAE);
Color fifthColor = Color(0xFFE1DEF0);

final title = TextStyle(
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 7.5,
  color: thirdColor,
  fontWeight: FontWeight.w700,
);

final subtitle = TextStyle(
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 5,
  color: thirdColor,
  fontWeight: FontWeight.w600,
);

final unfocusedSubtitle = TextStyle(
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 5,
  color: thirdColor,
  fontWeight: FontWeight.w400,
);

final body = TextStyle(
  fontFamily: 'Lexa',
  fontSize: SizeConfig.blockSizeH! * 3,
  color: thirdColor,
  fontWeight: FontWeight.w300,
);

