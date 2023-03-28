import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimens.dart';

class TextInputTitle extends StatelessWidget {
  final String title;
  final bool isEssential;
  const TextInputTitle(
      {super.key, required this.title, required this.isEssential});

  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(
          top: scaleHeight(context) * 24, bottom: scaleHeight(context) * 12),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: scaleFont(context) * 18,
                color: AppColors.Black,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
            TextSpan(text: '${title} '),
            isEssential
                ? TextSpan(text: '*', style: TextStyle(color: AppColors.Red))
                : TextSpan(text: ''),
          ])),
    );
  }
}
