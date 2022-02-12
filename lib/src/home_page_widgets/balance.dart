import 'package:companion/model/app_styles_light.dart';
import 'package:flutter/material.dart';
import 'package:companion/model/size_configs.dart';
import 'package:intl/intl.dart';

class Balance extends StatefulWidget {
  Balance({Key? key}) : super(key: key);

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override

  Widget build(BuildContext context) {

  SizeConfig().init(context);
  double sizeH = SizeConfig.blockSizeH!;
  double sizeV = SizeConfig.blockSizeV!;

  String cDate = DateFormat("MMM/dd").format(DateTime.now());

    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, sizeV * 4, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: sizeH * 90,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: primaryColor.withOpacity(0.5),
                      offset: Offset(0, 4),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [primaryColor, secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, sizeV * 2, sizeH * 4, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/berlitz.png',
                          color: Colors.white,
                          width: 80,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(sizeH * 4, sizeV * 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontFamily: 'Lexa',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(sizeH * 4, sizeV * 0, 0, sizeV * 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$1.980.000',
                          style: TextStyle(
                            fontFamily: 'Lexa',
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, sizeV * 2, sizeH * 4, sizeV * 0.7),
                          child: Text(cDate,
                              style: TextStyle(
                                fontFamily: 'Lexa',
                                color: Colors.white,
                                fontSize: 14,
                              )),
                        )
                      ],
                    ),
                  ),
                ])),
          ],
        ));
  }
}
