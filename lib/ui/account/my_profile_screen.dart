import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/controller/user_controller.dart';
import 'package:gogreen_client/ui/recipe/my_recipe_screen.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../models/meal_count.dart';
import '../../models/user_detail.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late Future<UserDetail?> userDetailFuture;

  @override
  void initState() {
    super.initState();
    updateUserDetail();
  }

  void updateUserDetail() {
    userDetailFuture = getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetail?>(
      future: userDetailFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return _myProfileBody(context, snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _myProfileBody(BuildContext context, UserDetail userDetail) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        title: const Text("My Profile"),
        titleTextStyle: text.headlineSmall?.copyWith(color: AppColors.White),
        elevation: 0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.Green,
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: scaleHeight(context) * 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${userDetail.sinceSignUp} days from start',
                      style:
                          text.bodyLarge!.copyWith(color: AppColors.LightGray),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: scaleWidth(context) * 12),
                          child: Text(
                            userDetail.name,
                            style: text.displaySmall
                                ?.copyWith(color: AppColors.White),
                          ),
                        ),
                        SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/leaf.svg',
                            semanticsLabel: 'leaf',
                            width: scaleWidth(context) * 60,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  scaleWidth(context) * 12,
                  scaleWidth(context) * 0,
                  scaleWidth(context) * 12,
                  scaleWidth(context) * 12,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.LightGreen,
                  ),
                  onPressed: () {
                    Get.to(() => const MyRecipeScreen())
                        ?.then((_) => setState(() {
                              updateUserDetail();
                            }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: scaleWidth(context) * 15),
                            child: Image.asset('assets/images/recipe_book.png',
                                semanticLabel: 'recipe_book',
                                fit: BoxFit.scaleDown),
                          ),
                          Text(
                            'Recipe List',
                            style: text.labelLarge,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.Green,
                        size: scaleWidth(context) * 15,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: scaleWidth(context) * 360,
              height: scaleHeight(context) * 440,
              padding: EdgeInsets.fromLTRB(scaleWidth(context) * 24,
                  scaleHeight(context) * 56, scaleWidth(context) * 24, 0),
              decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.Black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, -4), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('GoGreen Lawn', style: text.headlineSmall),
                    _gogreenLawn(userDetail.mealCount),
                    Text('Accumulated\nCarbonFoontprint Savings',
                        style: text.headlineSmall),
                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                  0,
                                  scaleHeight(context) * 20,
                                  scaleHeight(context) * 20,
                                  scaleHeight(context) * 20,
                                ),
                                height: scaleWidth(context) * 80,
                                width: scaleWidth(context) * 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 4, color: AppColors.Green)),
                                child: Text(
                                  '-${_getTotalCarbonFootPrints(userDetail).toStringAsFixed(2)}\nkgCO\u{2082}',
                                  style: text.labelLarge?.copyWith(
                                    fontSize: scaleFont(context) * 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'You saved total of',
                                    style: text.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.Black),
                                  ),
                                  Text(
                                      '${_getTotalCarbonFootPrints(userDetail).toStringAsFixed(2)}kgCO\u{2082}',
                                      style: text.labelLarge),
                                  Text(
                                    'carbon footprints.',
                                    style: text.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.Black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                            child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  right: scaleWidth(context) * 15),
                              child: Image.asset(
                                'assets/images/tree.png',
                                semanticLabel: 'tree',
                                width: scaleWidth(context) * 80,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'It is same as planting',
                                  style: text.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.Black),
                                ),
                                Text(
                                    '${double.parse(_convertToTree(userDetail).toStringAsFixed(2))} trees.',
                                    style: text.labelLarge),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gogreenLawn(List<MealCount> countList) {
    Map<DateTime, int> dataset = Map.fromIterable(countList,
        key: (e) {
          int year = e.date.year;
          int month = e.date.month;
          int day = e.date.day;
          return DateTime(year, month, day);
        },
        value: (e) => e.count);

    return HeatMap(
      //startDate: default값은 1년 전이고, 만약 scroll이 안된다면 6개월로 ㄱ
      datasets: dataset,
      colorsets: const {
        1: AppColors.Green,
      },
      colorMode: ColorMode.opacity,
      //size: of every block
      //fontSize:
      showText: false,
      scrollable: true,
      colorTipCount: 5,
    );
  }

  static const double carbonFootPrintMeat = 4.88;

  double _getTotalCarbonFootPrints(UserDetail userDetail) {
    //전체 평균 * meal count
    int sum = 0;
    for (var v in userDetail.mealCount) {
      sum += v.count;
    }
    double totalCarbonFootprint =
        sum * (carbonFootPrintMeat - userDetail.avgFootprint);
    return totalCarbonFootprint;
  }

  double _convertToTree(UserDetail userDetail) {
    double total = _getTotalCarbonFootPrints(userDetail);
    return total / 6.6;
  }
}
