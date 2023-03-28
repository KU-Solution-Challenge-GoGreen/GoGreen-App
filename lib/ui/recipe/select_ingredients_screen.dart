import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/controller/ingredient_controller.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../models/ingredient.dart';

class SelectIngredientsScreen extends StatefulWidget {
  const SelectIngredientsScreen({super.key});

  @override
  State<SelectIngredientsScreen> createState() =>
      _SelectIngredientsScreenState();
}

class _SelectIngredientsScreenState extends State<SelectIngredientsScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  late Future<List<Ingredient>> ingredientsFuture;

  List<Ingredient> originalSelectedIngredients =
      List<Ingredient>.from(Get.arguments);
  List<Ingredient> selectedIngredients = Get.arguments;

  @override
  void initState() {
    super.initState();
    ingredientsFuture = getIngredientList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.White,
        appBar: AppBar(
          backgroundColor: AppColors.Green,
          leading: const BackButton(color: AppColors.White),
          title: const Text("Select Ingredients"),
          titleTextStyle: TextStyle(
              color: AppColors.White,
              fontSize: scaleFont(context) * 18,
              fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(scaleWidth(context) * 24,
                scaleHeight(context) * 24, scaleWidth(context) * 24, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: scaleHeight(context) * 35,
                    child: TextField(
                      controller: _searchTextController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      style: TextStyle(
                          fontSize: scaleFont(context) * 16,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.normal,
                          color: AppColors.Black),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.DarkGray)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.Green, width: 2.0),
                        ),
                        hintText: 'Search ingredient',
                        hintStyle: TextStyle(color: AppColors.DarkGray),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.Green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: scaleHeight(context) * 570,
                      padding: EdgeInsets.symmetric(
                          vertical: scaleWidth(context) * 5),
                      child: FutureBuilder<List<Ingredient>>(
                        future: ingredientsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _recipeList(snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      )),
                  //button====================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shortButton('cancel', () {
                        Get.back(result: originalSelectedIngredients);
                      }, true),
                      shortButton('select (${selectedIngredients.length})', () {
                        Get.back(result: selectedIngredients);
                      }, false)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Ingredient> _searchedRecipes(List<Ingredient> ingredientsList) {
    if (_searchTextController.text == '') {
      return ingredientsList;
    } else {
      List<Ingredient> filteredList = ingredientsList.where((element) {
        return element.name
            .toLowerCase()
            .contains(_searchTextController.text.toLowerCase());
      }).toList();
      return filteredList;
    }
  }

  Widget _recipeList(List<Ingredient> ingredientsList) {
    List<Ingredient> searchedList = _searchedRecipes(ingredientsList);
    return ListView.separated(
      itemCount: searchedList.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        Ingredient currentValue = searchedList[index];
        final alreadySelected = selectedIngredients.contains(currentValue);
        return ListTile(
          title: Text(
            currentValue.name,
            style: TextStyle(
              fontSize: scaleFont(context) * 18,
            ),
          ),
          trailing: alreadySelected
              ? const Icon(Icons.check_circle_rounded, color: AppColors.Green)
              : const Icon(Icons.circle_outlined, color: AppColors.DarkGray),
          selected: alreadySelected,
          selectedColor: AppColors.Green,
          onTap: () {
            setState(() {
              if (alreadySelected) {
                selectedIngredients.remove(currentValue);
              } else {
                selectedIngredients.add(currentValue);
              }
            });
          },
          visualDensity: const VisualDensity(vertical: -3),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 1);
      },
    );
  }

  Widget shortButton(
      String title, Function onPressedFunc, bool isCancelButton) {
    return Container(
      width: scaleWidth(context) * 152,
      height: scaleHeight(context) * 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.Black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressedFunc();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isCancelButton ? AppColors.White : AppColors.Green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: scaleFont(context) * 18,
              color: isCancelButton ? AppColors.Black : AppColors.White,
            )),
      ),
    );
  }
}
