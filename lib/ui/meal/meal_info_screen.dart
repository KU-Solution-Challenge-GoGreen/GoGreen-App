import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/controller/meal_controller.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../controller/user_controller.dart';
import '../../models/meal.dart';
import '../../models/user_detail.dart';
import '../recipe/recipe_info_screen.dart';

class MealInfoProps {
  final String mealId;

  MealInfoProps({required this.mealId});
}

class MealInfoScreen extends StatefulWidget {
  const MealInfoScreen({super.key});
  @override
  State<MealInfoScreen> createState() => _MealInfoScreenState();
}

class _MealInfoScreenState extends State<MealInfoScreen> {
  final MealInfoProps props = Get.arguments;
  late Future<UserDetail?> userDetailFuture;
  @override
  initState() {
    super.initState();
    updateUserDetail();
  }

  void updateUserDetail() async {
    userDetailFuture = getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        leading: const BackButton(color: AppColors.White),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: AppColors.White,
            onPressed: () {}, //수정, 삭제 기능
          ),
        ],
        title: const Text("Meal Info"),
        titleTextStyle: TextStyle(
            color: AppColors.White,
            fontSize: scaleFont(context) * 18,
            fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: FutureBuilder<Meal?>(
          future: getMealById(props.mealId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _mealBody(snapshot.data!, context);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _mealBody(Meal meal, BuildContext context) {
    return SizedBox(
      width: scaleWidth(context) * 360,
      height: scaleHeight(context) * 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(scaleWidth(context) * 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: scaleWidth(context) * 10,
                right: scaleWidth(context) * 10,
                bottom: scaleHeight(context) * 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.MEd().format(meal.date),
                    style: TextStyle(
                      color: AppColors.Black,
                      fontWeight: FontWeight.bold,
                      fontSize: scaleFont(context) * 16,
                    ),
                  ),
                  Text(
                    meal.title,
                    style: TextStyle(
                      color: AppColors.Black,
                      fontWeight: FontWeight.bold,
                      fontSize: scaleFont(context) * 20,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                meal.photo!,
                width: scaleWidth(context) * 312,
                height: scaleWidth(context) * 312,
                fit: BoxFit.cover,
              ),
            ),
            _titleText('Recipe', context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: AppColors.Green),
                    padding: EdgeInsets.all(scaleHeight(context) * 16),
                    backgroundColor: AppColors.LightGreen,
                  ),
                  onPressed: () {
                    Get.to(() => RecipeInfoScreen(),
                        arguments: RecipeInfoProps(recipeId: meal.recipe.id));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        meal.title,
                        style: TextStyle(
                          color: AppColors.Green,
                          fontWeight: FontWeight.bold,
                          fontSize: scaleFont(context) * 16,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.Green,
                      )
                    ],
                  ),
                ),
              ],
            ),
            _titleText('Carbon Footprint', context),
            Container(
              width: scaleWidth(context) * 312,
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(context) * 20,
                horizontal: scaleWidth(context) * 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.Navy,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                    color: AppColors.DarkGray.withOpacity(0.5),
                  ),
                ],
              ),
              child: _CarbonFootprint(context, meal.carbonFootprint),
            ),
            _titleText('Memo', context),
            _boxContainer(
              context,
              Container(
                padding: EdgeInsets.only(
                  top: scaleHeight(context) * 24,
                ),
                width: scaleWidth(context) * 312,
                child: Text(
                  meal.memo!,
                  //overflow: TextOverflow.ellipsis,
                  //maxLines: null,
                  style: TextStyle(
                    color: AppColors.Black,
                    fontSize: scaleFont(context) * 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleText(String title, BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: scaleHeight(context) * 24,
          bottom: scaleHeight(context) * 10,
        ),
        child: Text(title,
            style: TextStyle(
                color: AppColors.DarkGray, fontSize: scaleFont(context) * 16)));
  }

  Widget _boxContainer(BuildContext context, Widget child) {
    return Container(
      width: scaleWidth(context) * 312,
      padding: EdgeInsets.only(
        left: scaleWidth(context) * 14,
        right: scaleWidth(context) * 14,
        bottom: scaleHeight(context) * 24,
      ),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.White,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 8),
            color: AppColors.DarkGray.withOpacity(0.5),
          ),
        ],
      ),
      child: child,
    );
  }

  static const int carbonFootPrintMeat = 4880;

  Widget _CarbonFootprint(BuildContext context, double thisMeal) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: scaleHeight(context) * 145,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: scaleHeight(context) * 34,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: scaleWidth(context) * 312,
                          height: scaleHeight(context) * 14,
                          decoration: BoxDecoration(
                            color: AppColors.TreeGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  carbonFootPrintMeat.toString(),
                                  style: TextStyle(
                                      color: AppColors.White,
                                      fontSize: scaleFont(context) * 12,
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.normal),
                                ),
                                SvgPicture.asset(
                                  'assets/images/foot_print_white.svg',
                                  semanticsLabel: 'foot_print_white',
                                  width: scaleWidth(context) * 16,
                                  fit: BoxFit.scaleDown,
                                )
                              ])),
                      Text(
                        "one meal including meat",
                        style:
                            text.bodyMedium?.copyWith(color: AppColors.White),
                      ),
                    ],
                  )),
              SizedBox(
                  height: scaleHeight(context) * 34,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _carbonFootPrintTotalAverageBar(),
                        Text("average of every meal I ate",
                            style: text.bodyMedium
                                ?.copyWith(color: AppColors.White)),
                      ])),
              SizedBox(
                height: scaleHeight(context) * 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _carbonFootPrintThisMealBar(thisMeal, context),
                    Text(
                      "this meal",
                      style: text.bodyMedium?.copyWith(color: AppColors.White),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<int> _carbonFootPrintTotalAverage() async {
    UserDetail? userDetail = await getUserDetail();
    if (userDetail != null) {
      return (userDetail.avgFootprint * 1000).toInt();
    } else {
      return 0;
    }
  }

  Widget _carbonFootPrintTotalAverageBar() {
    return FutureBuilder(
        future: userDetailFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            int barWidth = 32;
            int totalAvg = snapshot.data == null
                ? 0
                : (snapshot.data.avgFootprint * 1000).toInt();
            if (totalAvg >= carbonFootPrintMeat) {
              barWidth = 312;
            }
            if (totalAvg != 0) {
              barWidth = (280 * totalAvg ~/ carbonFootPrintMeat) + 32;
            }

            return Container(
                width: scaleWidth(context) * barWidth,
                height: scaleHeight(context) * 14,
                decoration: BoxDecoration(
                  color: AppColors.GrassGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        totalAvg.toString(),
                        style: TextStyle(
                            color: AppColors.White,
                            fontSize: scaleFont(context) * 12,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.normal),
                      ),
                      SvgPicture.asset(
                        'assets/images/foot_print_white.svg',
                        semanticsLabel: 'foot_print_white',
                        width: scaleWidth(context) * 16,
                        fit: BoxFit.scaleDown,
                      )
                    ]));
          } else {
            return Center(
                child: SizedBox(
              width: scaleHeight(context) * 12,
              height: scaleHeight(context) * 12,
              child: const CircularProgressIndicator(
                strokeWidth: 1.0,
                backgroundColor: Colors.transparent,
                color: AppColors.DarkGray,
              ),
            ));
          }
        });
  }

  Widget _carbonFootPrintThisMealBar(double data, BuildContext context) {
    int barWidth = 28;
    int thismeal = (data * 1000).toInt();
    if (thismeal >= carbonFootPrintMeat) {
      barWidth = 312;
    }
    if (thismeal != 0) {
      barWidth = (280 * thismeal ~/ carbonFootPrintMeat) + 32;
    }
    return Container(
      width: scaleWidth(context) * barWidth,
      height: scaleHeight(context) * 14,
      decoration: BoxDecoration(
        color: AppColors.SandyYellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '  ${thismeal.toString()}',
            style: TextStyle(
                color: AppColors.Black,
                fontSize: scaleFont(context) * 12,
                fontFamily: 'roboto',
                fontWeight: FontWeight.normal),
          ),
          SvgPicture.asset(
            'assets/images/foot_print_black.svg',
            semanticsLabel: 'foot_print_black',
            width: scaleWidth(context) * 16,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
