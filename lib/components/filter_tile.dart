import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';

import '../models/meal_explore.dart';

class VeganFilterTile extends StatelessWidget {
  // VeganFilterTile(this._veganTypeInfo);

  // final MealExplore _veganTypeInfo;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => {},
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.LightGreen,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          height: scaleHeight(context) * 35,
          width: scaleWidth(context) * 312,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: scaleWidth(context) * 9,
                  ),
                  SvgPicture.asset(
                    'assets/images/filter_check.svg',
                    color: AppColors.DarkGray,
                  ),
                  SizedBox(
                    width: scaleWidth(context) * 6,
                  ),
                  Text("Pesco",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontSize: scaleFont(context) * 14,
                          fontFamily: 'roboto'))
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/vegan_type/carrot.svg',
                    width: 30,
                  ),
                  SvgPicture.asset(
                    'assets/images/vegan_type/filter_check.svg',
                  )
                  // Container(
                  //   foregroundDecoration: BoxDecoration(
                  //     color: Colors.grey,
                  //     backgroundBlendMode: BlendMode.saturation,
                  //   ),
                  //   child: SvgPicture.asset(
                  //     'assets/images/vegan_type/carrot.svg',
                  //     width: 30,
                  //   ),
                  // )
                ],
              )
            ],
          )),
    );
  }
}
