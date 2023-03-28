import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/textinput_title.dart';
import 'package:gogreen_client/models/step_data.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/enums.dart';
import '../../controller/recipe_controller.dart';
import '../../controller/user_controller.dart';
import '../../models/recipe.dart';
import '../../models/user_detail.dart';

class RecipeInfoProps {
  final String recipeId;

  RecipeInfoProps({required this.recipeId});
}

class RecipeInfoScreen extends StatefulWidget {
  const RecipeInfoScreen({super.key});

  @override
  State<RecipeInfoScreen> createState() => _RecipeInfoScreenState();
}

class _RecipeInfoScreenState extends State<RecipeInfoScreen> {
  final RecipeInfoProps props = Get.arguments;
  late Future<UserDetail?> userDetailFuture;

  bool isBookmarked = false;
  @override
  initState() {
    super.initState();
    updateUserDetail();
  }

  void updateUserDetail() async {
    userDetailFuture = getUserDetail();
  }

  @override
  Widget build(context) {
    return FutureBuilder<Recipe?>(
      future: getRecipeById(props.recipeId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          isBookmarked = snapshot.data!.isBookmarked;
          return _recipeBody(snapshot.data!, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _recipeBody(Recipe recipeData, BuildContext context) {
    bool isMine = recipeData.userId == FirebaseAuth.instance.currentUser!.uid;

    Map<String, bool> getCategoryList() {
      late Map<String, bool> categoryList = {
        'vegetable': true,
        'dairy': false,
        'egg': false,
        'seafood': false,
        'poultry': false,
        'meat': false
      };
      for (var categoryId in recipeData.categories) {
        categoryList[CategoryType.getById(categoryId.id).name] = true;
      }
      return categoryList;
    }

    List<Widget> getCategoryIconList(
        Map<String, bool> categoryList, BuildContext context) {
      return categoryList.entries.map((category) {
        String categoryName = category.key;
        bool isIncluded = category.value;
        if (isIncluded == true) {
          return Image.asset('assets/images/${categoryName}_on.png',
              semanticLabel: '${categoryName}_on',
              width: scaleWidth(context) * 16,
              fit: BoxFit.scaleDown);
        } else {
          return Image.asset('assets/images/${categoryName}_off.png',
              semanticLabel: '${categoryName}_off',
              width: scaleWidth(context) * 16,
              fit: BoxFit.scaleDown);
        }
      }).toList();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        leading: const BackButton(color: AppColors.White),
        title: const Text("Recipe Info"),
        titleTextStyle: TextStyle(
            color: AppColors.White,
            fontSize: scaleFont(context) * 18,
            fontWeight: FontWeight.bold),
        actions: [
          isMine == true
              ? IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    //modify, delete
                  })
              : IconButton(
                  icon: isBookmarked
                      ? const Icon(Icons.bookmark)
                      : const Icon(Icons.bookmark_outline_rounded),
                  onPressed: () {
                    toggleBookmark(recipeData.id);
                    _toggleBookmark();
                  })
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(
            scaleWidth(context) * 24,
            scaleWidth(context) * 12,
            scaleWidth(context) * 24,
            scaleWidth(context) * 24,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipeData.name,
                  style: TextStyle(
                    color: AppColors.Black,
                    fontWeight: FontWeight.bold,
                    fontSize: scaleFont(context) * 22,
                  ),
                ),
                _titleText('Recipe Info', context),
                _boxContainer(
                  context,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextInputTitle(
                          title: 'Ingredient Type', isEssential: false),
                      SizedBox(
                        width: scaleWidth(context) * 116,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              getCategoryIconList(getCategoryList(), context),
                        ),
                      ),
                      const TextInputTitle(
                          title: 'Ingredients', isEssential: false),
                      Wrap(
                        children: recipeData.ingredients.map(
                          (ingredient) {
                            return _ingredientElement(ingredient.name, context);
                          },
                        ).toList(),
                      ),
                      const TextInputTitle(
                          title: 'Cooking Time', isEssential: false),
                      Text(
                        '${recipeData.duration} minutes',
                        style: TextStyle(
                          color: AppColors.Black,
                          fontSize: scaleFont(context) * 16,
                        ),
                      ),
                    ],
                  ),
                ),
                _titleText('Carbon Footprints', context),
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
                        offset: const Offset(0, 8),
                        color: AppColors.DarkGray.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: _carbonFootprint(context, recipeData),
                ),
                _titleText('Meals with this recipe', context),
                Container(
                  width: scaleWidth(context) * 312,
                  height: scaleHeight(context) * 120,
                  padding: EdgeInsets.symmetric(
                    vertical: scaleWidth(context) * 14,
                    horizontal: scaleWidth(context) * 14,
                  ),
                  alignment: Alignment.center,
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
                  child: ListView.builder(
                    itemCount: recipeData.photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context) * 3,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            recipeData.photos[index],
                            width: scaleHeight(context) * 98,
                            height: scaleHeight(context) * 98,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                _titleText('Steps', context),
                _boxContainer(
                  context,
                  Container(
                    padding: EdgeInsets.only(
                      top: scaleHeight(context) * 24,
                    ),
                    child: Column(
                      children: List.generate(recipeData.steps.length, (index) {
                        return _stepTile(
                            context, recipeData.steps[index], index);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  Widget _ingredientElement(String name, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) * 3,
          vertical: scaleHeight(context) * 4),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: scaleHeight(context) * 10,
            vertical: scaleHeight(context) * 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.Green, width: 1)),
        child: Text(
          name,
          style: TextStyle(
              color: AppColors.Green, fontSize: scaleFont(context) * 14),
        ),
      ),
    );
  }

  Widget _stepTile(BuildContext context, StepData step, int index) {
    return Container(
      width: scaleWidth(context) * 300,
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(context) * 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: scaleWidth(context) * 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('step ${index + 1}.',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(step.description,
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          step.photo != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    step.photo!,
                    width: scaleWidth(context) * 60,
                    height: scaleWidth(context) * 60,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void _toggleBookmark() {
    setState(() => isBookmarked = !isBookmarked);
  }

  static const int carbonFootPrintMeat = 4880;

  Widget _carbonFootprint(BuildContext context, Recipe recipeData) {
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
                    _carbonFootPrintThisMealBar(
                        recipeData.carbonFootprint, context),
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
