import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/meal_explore_tile.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/controller/meal_controller.dart';
import 'package:gogreen_client/models/meal_summary.dart';
import 'package:gogreen_client/ui/explore/set_filter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late List<MealSummary> mealList = [];
  late String? _selectedVeganTypeId;
  late SharedPreferences _prefs;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _loadVeganType().then((value) {
      setMealList(_selectedVeganTypeId).then((result) {
        setState(() {
          mealList = result;
        });
      });
    });
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(const Duration(seconds: 0));

    setState(() {
      _loadVeganType().then((value) {
        setMealList(_selectedVeganTypeId).then((result) {
          setState(() {
            mealList = result;
          });
        });
      });
    });
  }

  Future<void> _loadVeganType() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedVeganTypeId = _prefs.getString('selected_vegan_type_id');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        title: const Text("Explore"),
        titleTextStyle: TextStyle(
            fontFamily: 'roboto',
            color: AppColors.White,
            fontSize: scaleFont(context) * 28,
            fontWeight: FontWeight.bold),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: SvgPicture.asset(
              'assets/images/filter_icon.svg',
              color: Colors.white,
            ),
            onPressed: () async {
              Get.to(() => const SetFilterScreen())
                  ?.then((value) => refreshList());
            },
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: refreshList,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: mealList.length,
              itemBuilder: (BuildContext context, int index) {
                return MealExploreTile(mealList[index]);
              }),
        ),
      ),
    );
  }
}

// ######## Meal리스트 API 호출 ##########
// ######## GET meals/       ###########

Future<List<MealSummary>> setMealList(String? typeId) async {
  return await getMealsByType(typeId);
}
