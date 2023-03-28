import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogreen_client/constants/colors.dart';

import '../../controller/user_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'logo',
              ),
              Container(
                width: double.infinity,
              )
            ],
          ),
          SignInButton(Buttons.Google, onPressed: () {
            signInWithGoogle();
            //Navigator.pushNamed(context, '/setnick_or_dailymeal');
          }),
        ],
      ),
    );
  }
}
