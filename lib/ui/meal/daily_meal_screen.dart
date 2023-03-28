import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/meal_tile.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/models/user_detail.dart';
import 'package:gogreen_client/ui/meal/add_meal_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/meal_controller.dart';
import '../../controller/user_controller.dart';
import '../../models/meal_summary.dart';
import '../../models/profile.dart';

class DailyMealScreen extends StatefulWidget {
  const DailyMealScreen({super.key});

  @override
  State<DailyMealScreen> createState() => _DailyMealScreenState();
}

class _DailyMealScreenState extends State<DailyMealScreen> {
  late DateTime _selectedDate;

  late List<MealSummary> meals;
  late Profile? profile;
  late XFile? _pickedFile;
  static const int carbonFootPrintMeat = 4880;

  late Future<List<MealSummary>> mealListFuture;
  late Future<UserDetail?> userDetailFuture;

  @override
  initState() {
    super.initState();

    _selectedDate = DateTime.now();
    updateMealsData(_selectedDate);
    updateUserDetail();
  }

  void updateMealsData(DateTime date) async {
    mealListFuture =
        getMealsByDate(FirebaseAuth.instance.currentUser!.uid, date);
  }

  void updateUserDetail() async {
    userDetailFuture = getUserDetail();
  }

  int _carbonFootPrintReducedToday(List<MealSummary> mealList) {
    int carbonFootPrintTodayAverage = _carbonFootPrintTodayAverage(mealList);
    return carbonFootPrintMeat - carbonFootPrintTodayAverage;
  }

  Widget carbonFootPrintReducedTodayText() {
    return FutureBuilder<List<MealSummary>>(
        future: mealListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              _carbonFootPrintReducedToday(snapshot.data).toString(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: AppColors.White),
            );
          } else {
            return SizedBox(
              width: scaleHeight(context) * 24,
              height: scaleHeight(context) * 24,
              child: const CircularProgressIndicator(
                strokeWidth: 2.0,
                backgroundColor: Colors.transparent,
                color: AppColors.DarkGray,
              ),
            );
          }
        });
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

  int _carbonFootPrintTodayAverage(List<MealSummary> mealList) {
    int carbonFootPrintSumToday = 0;
    for (var meal in mealList) {
      carbonFootPrintSumToday += (meal.carbonFootprint * 1000).toInt();
    }
    if (carbonFootPrintSumToday == 0) {
      return carbonFootPrintSumToday;
    } else {
      return carbonFootPrintSumToday ~/ mealList.length;
    }
  }

  Widget _carbonFootPrintTodayAverageBar() {
    return FutureBuilder<List<MealSummary>>(
        future: mealListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            int barWidth = 32;
            int todayAverage = _carbonFootPrintTodayAverage(snapshot.data);
            if (todayAverage >= carbonFootPrintMeat) {
              barWidth = 312;
            }
            if (todayAverage != 0) {
              barWidth = (280 * todayAverage ~/ carbonFootPrintMeat) + 32;
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
                        todayAverage.toString(),
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

  Widget _dailyMealList() {
    return FutureBuilder<List<MealSummary>>(
        future: mealListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Firebase load fail'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            meals = snapshot.data;
            return ListView.builder(
                itemCount: meals.length,
                itemBuilder: (BuildContext context, int index) {
                  return MealTile(meal: meals[index]);
                });
          } else {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color.primary,
      floatingActionButton: DateTime.now().isAfter(_selectedDate)
          ? FloatingActionButton(
              backgroundColor: color.primary,
              child: const Icon(Icons.add, color: AppColors.White),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: scaleWidth(context) * 360,
                        height: scaleHeight(context) * 120,
                        padding: EdgeInsets.symmetric(
                            vertical: scaleHeight(context) * 16,
                            horizontal: scaleWidth(context) * 24),
                        decoration: BoxDecoration(
                            color: AppColors.White,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.photo_camera,
                                ),
                                label: const Text(
                                  "Camera",
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    iconColor: MaterialStateProperty.all(
                                        AppColors.Green),
                                    iconSize: MaterialStateProperty.all(
                                        scaleWidth(context) * 24),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.LightGray),
                                    fixedSize: MaterialStateProperty.all(Size(
                                        scaleWidth(context) * 140,
                                        scaleHeight(context) * 70))),
                                onPressed: () async {
                                  await _getImageFromCamera();
                                  if (_pickedFile != null) {
                                    Get.to(() => const AddMealScreen(),
                                            arguments: AddMealProps(
                                                mealImage: _pickedFile!,
                                                selectedDate: _selectedDate))
                                        ?.then((value) {
                                      updateMealsData(_selectedDate);
                                      updateUserDetail();
                                      setState(() {});
                                    });
                                  }
                                },
                              ),
                              OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.collections,
                                ),
                                label: const Text(
                                  "Gallery",
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    iconColor: MaterialStateProperty.all(
                                        AppColors.Green),
                                    iconSize: MaterialStateProperty.all(
                                        scaleWidth(context) * 24),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.LightGray),
                                    fixedSize: MaterialStateProperty.all(Size(
                                        scaleWidth(context) * 140,
                                        scaleHeight(context) * 70))),
                                onPressed: () async {
                                  await _getImageFromGallery();
                                  if (_pickedFile != null) {
                                    Get.to(() => const AddMealScreen(),
                                            arguments: _pickedFile)
                                        ?.then((value) {
                                      updateMealsData(_selectedDate);
                                      updateUserDetail();
                                      setState(() {});
                                    });
                                  }
                                },
                              ),
                            ]),
                      );
                    });
              })
          : null,
      body: SafeArea(
          child: SizedBox(
              width: scaleWidth(context) * 360,
              height: scaleHeight(context) * 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CalendarTimeline(
                    initialDate: _selectedDate,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    onDateSelected: (date) => setState(() {
                      _selectedDate = date;
                      updateMealsData(date);
                    }),
                    dayColor: AppColors.DeepGray,
                    activeBackgroundDayColor: AppColors.White,
                    activeDayColor: AppColors.Black,
                    monthColor: AppColors.Black,
                    leftMargin: scaleWidth(context) * 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: scaleHeight(context) * 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: scaleHeight(context) * 24,
                            horizontal: scaleWidth(context) * 24),
                        color: AppColors.Navy,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Carbon footprint reduced per meal today",
                                style: text.bodyMedium
                                    ?.copyWith(color: AppColors.White),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: scaleHeight(context) * 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        carbonFootPrintReducedTodayText(),
                                        SvgPicture.asset(
                                          'assets/images/foot_print_white.svg',
                                          semanticsLabel: 'foot_print_white',
                                          width: scaleWidth(context) * 24,
                                          fit: BoxFit.scaleDown,
                                        )
                                      ])),
                              SizedBox(
                                  height: scaleHeight(context) * 145,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: scaleHeight(context) * 34,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: scaleWidth(context) *
                                                        312,
                                                    height:
                                                        scaleHeight(context) *
                                                            14,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.TreeGreen,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            carbonFootPrintMeat
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .White,
                                                                fontSize: scaleFont(
                                                                        context) *
                                                                    12,
                                                                fontFamily:
                                                                    'roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/images/foot_print_white.svg',
                                                            semanticsLabel:
                                                                'foot_print_white',
                                                            width: scaleWidth(
                                                                    context) *
                                                                16,
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          )
                                                        ])),
                                                Text(
                                                  "one meal including meat",
                                                  style: text.bodyMedium
                                                      ?.copyWith(
                                                          color:
                                                              AppColors.White),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            height: scaleHeight(context) * 34,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _carbonFootPrintTotalAverageBar(),
                                                  Text(
                                                      "average of every meal I ate",
                                                      style: text.bodyMedium
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .White)),
                                                ])),
                                        SizedBox(
                                            height: scaleHeight(context) * 34,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _carbonFootPrintTodayAverageBar(),
                                                  Text(
                                                    "average of today’s meals",
                                                    style: text.bodyMedium
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .White),
                                                  ),
                                                ])),
                                      ]))
                            ]),
                      )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context) * 24,
                        horizontal: scaleWidth(context) * 24),
                    color: AppColors.LightGray,
                    child: _dailyMealList(),
                  )),
                ],
              ))),
    );
  }

  _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        Get.back();
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택 안함');
      }
    }
  }

  _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        Get.back();
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택 안함');
      }
    }
  }
}
