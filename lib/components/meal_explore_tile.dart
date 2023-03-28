import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/models/meal_summary.dart';
import 'package:gogreen_client/ui/meal/meal_info_screen.dart';

// ########## 요일 변환기 ##########
Map<int, String> num2weekday = {
  1: "Mon",
  2: "Tue",
  3: "Wed",
  4: "Thu",
  5: "Fri",
  6: "Sat",
  7: "Sun",
};

class MealExploreTile extends StatelessWidget {
  MealExploreTile(this._meal);

  late MealSummary _meal;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => {
        Get.to(() => const MealInfoScreen(),
            arguments: MealInfoProps(mealId: _meal.id))
      },
      child: SizedBox(
        height: scaleHeight(context) * 259,
        width: maxWidth,
        child: Column(
          children: [
            _meal.photo == null
                ? FittedBox(
                    child: Image.asset(
                      "assets/images/sample_meal.png",
                      width: maxWidth,
                      height: scaleHeight(context) * 180,
                      fit: BoxFit.cover,
                    ),
                  )
                : FittedBox(
                    child: Image.network(
                      '${_meal.photo}',
                      width: maxWidth,
                      height: scaleHeight(context) * 180,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        print(exception);
                        return Image.asset(
                          "assets/images/sample_meal.png",
                          width: maxWidth,
                          height: scaleHeight(context) * 180,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(scaleWidth(context) * 14, 0, 0, 0),
              height: scaleHeight(context) * 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: scaleHeight(context) * 7,
                  ),
                  Text(
                    "${_meal.title}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: scaleFont(context) * 16),
                  ),
                  SizedBox(
                    height: scaleHeight(context) * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: scaleFont(context) * 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: 'Recipe: '),
                            TextSpan(
                              text: '${_meal.recipeName}',
                              style: const TextStyle(
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          "${_meal.userName}   ${_meal.date.month}/${_meal.date.day} ${num2weekday[_meal.date.weekday]} ",
                          style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: scaleFont(context) * 10,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: scaleWidth(context) * 9,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: scaleWidth(context) * 1,
              height: scaleHeight(context) * 14,
            ),
          ],
        ),
      ),
    );
  }
}
