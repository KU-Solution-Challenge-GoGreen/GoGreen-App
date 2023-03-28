import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/complete_button.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/constants/enums.dart';
import 'package:gogreen_client/ui/meal/daily_meal_screen.dart';

import '../../controller/user_controller.dart';

class SetNicknameScreen extends StatefulWidget {
  const SetNicknameScreen({super.key});

  @override
  State<SetNicknameScreen> createState() {
    return _SetNicknameScreenState();
  }
}

class _SetNicknameScreenState extends State<SetNicknameScreen> {
  FocusNode nicknameFocus = FocusNode();

  final TextEditingController _nicknameTextController = TextEditingController();

  void _handleNicknameSubmitted(String text) async {
    if (text == "") {
      //text가 ""이면 alert
      nicknameAlert("enter a nickname");
    } else {
      //이미 존재하는 이름이어도 alert
      ResponseStatus result = await registerUserToDB(text);
      if (result == ResponseStatus.error) {
        nicknameAlert("duplicated nickname");
        return;
      }
      Get.off(() => const DailyMealScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.Green,
        body: SizedBox(
            width: scaleWidth(context) * 360,
            height: scaleHeight(context) * 800,
            child: Stack(
              children: <Widget>[
                SizedBox(
                    width: scaleWidth(context) * 360,
                    height: scaleHeight(context) * 240,
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      semanticsLabel: 'logo',
                      width: scaleWidth(context) * 240,
                      fit: BoxFit.scaleDown,
                    )),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: scaleWidth(context) * 360,
                      height: scaleHeight(context) * 592,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(
                          scaleWidth(context) * 24,
                          scaleHeight(context) * 56,
                          scaleWidth(context) * 24,
                          0),
                      decoration: const BoxDecoration(
                          color: AppColors.White,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: scaleHeight(context) * 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: scaleHeight(context) * 12),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontSize: scaleFont(context) * 18,
                                              fontFamily: 'roboto',
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.Black),
                                        )),
                                    TextField(
                                      enabled: false,
                                      style: TextStyle(
                                          fontSize: scaleFont(context) * 16,
                                          fontFamily: 'roboto',
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.Black),
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.DarkGray)),
                                          hintText: 'hcy1722@korea.ac.kr',
                                          hintStyle: TextStyle(
                                              color: AppColors.LightGray)),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: scaleHeight(context) * 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: scaleHeight(context) * 12),
                                      child: Text(
                                        "Nickname",
                                        style: TextStyle(
                                            fontSize: scaleFont(context) * 18,
                                            fontFamily: 'roboto',
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.Black),
                                      ),
                                    ),
                                    TextField(
                                      controller: _nicknameTextController,
                                      style: TextStyle(
                                          fontSize: scaleFont(context) * 16,
                                          fontFamily: 'roboto',
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.Black),
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.DarkGray)),
                                          hintText: 'Please Enter Nickname.',
                                          hintStyle: TextStyle(
                                              color: AppColors.LightGray)),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: scaleHeight(context) * 190),
                              child: CompleteButton(
                                  title: "Sign up",
                                  onPressedFunc: () {
                                    _handleNicknameSubmitted(
                                        _nicknameTextController.text);
                                  }),
                            )
                          ]),
                    ))
              ],
            )));
  }

  void nicknameAlert(String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: const <Widget>[
                Text("Caution"),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
