import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';

import '../../controller/user_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.Green,
        body: SafeArea(
            child: SizedBox(
          width: scaleWidth(context) * 360,
          height: scaleHeight(context) * 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: scaleHeight(context) * 289),
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    semanticsLabel: 'logo',
                  )),
              Padding(
                  padding: EdgeInsets.only(top: scaleHeight(context) * 266),
                  child: SignInButton(Buttons.Google, onPressed: () {
                    signInWithGoogle();
                    //Navigator.pushNamed(context, '/setnick_or_dailymeal');
                  })),
            ],
          ),
        )));
  }
}
