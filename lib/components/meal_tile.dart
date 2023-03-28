import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/constants/enums.dart';
import 'package:gogreen_client/models/meal_summary.dart';
import 'package:gogreen_client/ui/meal/meal_info_screen.dart';

class MealTile extends StatelessWidget {
  final MealSummary meal;
  static const int carbonFootPrintMeat = 4880;

  Color _getBarColor() {
    if ((meal.carbonFootprint * 1000) >= carbonFootPrintMeat) {
      return CarbonFootPrintAmountType.getByRatio(100).barColor;
    }
    int ratio = meal.carbonFootprint ~/ carbonFootPrintMeat;
    return CarbonFootPrintAmountType.getByRatio(ratio).barColor;
  }

  Map<String, bool> _categoryList() {
    late Map<String, bool> categoryList = {
      'vegetable': true,
      'dairy': false,
      'egg': false,
      'seafood': false,
      'poultry': false,
      'meat': false
    };
    for (var categoryId in meal.categoryIds) {
      categoryList[CategoryType.getById(categoryId).name] = true;
    }
    return categoryList;
  }

  List<Widget> _categoryIconList(
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

  const MealTile({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => MealInfoScreen(),
              arguments: MealInfoProps(mealId: meal.id));
        },
        child: SizedBox(
            width: scaleWidth(context) * 312,
            height: scaleHeight(context) * 112,
            child: Card(
                color: AppColors.White,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 4.0,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: _getBarColor(),
                          width: 3.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context) * 12,
                        horizontal: scaleWidth(context) * 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                meal.title,
                                style: TextStyle(
                                    color: AppColors.Black,
                                    fontFamily: 'roboto',
                                    fontSize: scaleFont(context) * 18,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                meal.recipeName,
                                style: TextStyle(
                                    color: AppColors.DeepGray,
                                    fontFamily: 'roboto',
                                    fontSize: scaleFont(context) * 12,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(children: [
                                Text(
                                  (meal.carbonFootprint * 1000)
                                      .toInt()
                                      .toString(),
                                  style: TextStyle(
                                      color: AppColors.DeepGray,
                                      fontSize: scaleFont(context) * 12,
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.normal),
                                ),
                                SvgPicture.asset(
                                  'assets/images/foot_print_deepgray.svg',
                                  semanticsLabel: 'foot_print_deepgray',
                                  width: scaleWidth(context) * 16,
                                  fit: BoxFit.scaleDown,
                                )
                              ]),
                              SizedBox(
                                  width: scaleWidth(context) * 116,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: _categoryIconList(
                                          _categoryList(), context)))
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              meal.photo!,
                              fit: BoxFit.cover,
                              width: scaleHeight(context) * 88,
                              height: scaleHeight(context) * 88,
                            ),
                          ),
                        ])))));
  }
}
