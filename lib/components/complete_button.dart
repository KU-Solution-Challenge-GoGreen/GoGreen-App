import 'package:flutter/material.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';

class CompleteButton extends StatelessWidget {
  final String title;
  final Function onPressedFunc;
  const CompleteButton(
      {super.key, required this.title, required this.onPressedFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(context) * 312,
      height: scaleHeight(context) * 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.Black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.pushNamed(context, routeURL);
          onPressedFunc();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.Green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: scaleFont(context) * 18,
            )),
      ),
    );
  }
}
