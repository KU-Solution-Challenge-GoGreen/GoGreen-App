import 'package:flutter/material.dart';

class Dimens {
  Dimens._();
  //for all screens
  static const double horizontal_padding = 12.0;
  static const double vertical_padding = 12.0;
}

double scaleWidth(BuildContext context) {
  const designGuideWidth = 360;
  final deviceWidth = MediaQuery.of(context).size.width;
  final diff = deviceWidth / designGuideWidth;
  return diff;
}

double scaleHeight(BuildContext context) {
  const designGuideHeight = 800;
  final deviceHeight = MediaQuery.of(context).size.height;
  final diff = deviceHeight / designGuideHeight;
  return diff;
}

double scaleFont(BuildContext context) {
  return scaleHeight(context);
}

double buttonBottomMargin(BuildContext context) {
  return scaleHeight(context) * 68;
}

//실사용
//  Container(
//  	height: 224 * scaleWidth(context),
//  ),
