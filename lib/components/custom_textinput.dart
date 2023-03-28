import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimens.dart';

class customTextInput extends StatelessWidget {
  final TextEditingController textController;
  final int? minLine;
  final int? maxLine;
  final String? hintText;
  const customTextInput(
      {super.key,
      required this.textController,
      required this.minLine,
      required this.maxLine,
      required this.hintText});
  @override
  Widget build(context) {
    return TextFormField(
        controller: textController,
        maxLines: maxLine,
        minLines: minLine,
        style: TextStyle(
            fontSize: scaleFont(context) * 16,
            fontFamily: 'roboto',
            fontWeight: FontWeight.normal,
            color: AppColors.Black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.DarkGray)),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.DarkGray),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.Green,
              width: 2,
            ),
          ),
        ),
        validator: (v) {
          if (v!.trim().isEmpty) return 'Please enter something';
          return null;
        });
  }
}
