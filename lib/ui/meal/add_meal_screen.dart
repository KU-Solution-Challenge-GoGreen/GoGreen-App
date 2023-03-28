import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/custom_textinput.dart';
import 'package:gogreen_client/components/textinput_title.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/constants/dimens.dart';
import 'package:gogreen_client/controller/meal_controller.dart';
import 'package:gogreen_client/models/input/meal_input.dart';
import 'package:gogreen_client/models/input/photo_input.dart';
import 'package:gogreen_client/models/recipe_summary.dart';
import 'package:gogreen_client/ui/recipe/select_recipe_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../components/complete_button.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class AddMealProps {
  final XFile mealImage;
  final DateTime selectedDate;
  AddMealProps({required this.mealImage, required this.selectedDate});
}

class _AddMealScreenState extends State<AddMealScreen> {
  FocusNode titleFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  late DateTime dateTime;

  bool isSelected = false;

  RecipeSummary? _selectedRecipe;

  final AddMealProps props = Get.arguments;

  @override
  void initState() {
    dateTime = props.selectedDate;
    isSelected = (_selectedRecipe != null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.White,
        appBar: AppBar(
          backgroundColor: AppColors.Green,
          leading: const BackButton(color: AppColors.White),
          title: const Text("Add Meal"),
          titleTextStyle: TextStyle(
              color: AppColors.White,
              fontSize: scaleFont(context) * 18,
              fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(scaleWidth(context) * 24,
                scaleHeight(context) * 24, scaleWidth(context) * 24, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: FileImage(File(props.mealImage.path)),
                        width: scaleWidth(context) * 312,
                        height: scaleWidth(context) * 312,
                        fit: BoxFit.cover,
                      )),
                  const TextInputTitle(
                    title: 'Date',
                    isEssential: true,
                  ),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: DateFormat('MM/dd/y').format(dateTime),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.DarkGray)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.Green,
                          width: 2,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: scaleFont(context) * 16,
                        color: AppColors.Black,
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.insert_invitation,
                        ),
                        color: AppColors.Black,
                        highlightColor: AppColors.LightGreen,
                        onPressed: () async {
                          DateTime? calendarDateTime =
                              await showRoundedDatePicker(
                            context: context,
                            initialDate: props.selectedDate,
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime(DateTime.now().year + 1),
                            borderRadius: 16,
                            theme: ThemeData(
                              primaryColor: AppColors.Green,
                              colorScheme: ColorScheme.fromSwatch()
                                  .copyWith(secondary: AppColors.Green),
                            ),
                          );
                          if (calendarDateTime != null) {
                            setState(() => dateTime = calendarDateTime);
                          }
                        },
                      ),
                    ),
                  ),
                  const TextInputTitle(title: 'Title', isEssential: true),
                  customTextInput(
                    textController: _titleTextController,
                    hintText: 'Please enter title',
                    minLine: 1,
                    maxLine: 1,
                  ),
                  const TextInputTitle(
                    title: 'Description',
                    isEssential: false,
                  ),
                  customTextInput(
                    textController: _descriptionTextController,
                    hintText: 'Please enter description',
                    minLine: 5,
                    maxLine: null,
                  ),
                  const TextInputTitle(
                    title: 'Recipe',
                    isEssential: false,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(
                          width: 1.0,
                          color: isSelected
                              ? AppColors.Green
                              : AppColors.DarkGray),
                      padding: EdgeInsets.all(scaleHeight(context) * 16),
                      backgroundColor:
                          isSelected ? AppColors.LightGreen : AppColors.White,
                    ),
                    onPressed: () async {
                      final RecipeSummary? recipe =
                          await Get.to<RecipeSummary?>(
                              () => const SelectRecipeScreen(),
                              arguments: SelectRecipeProps(_selectedRecipe));

                      if (recipe != null) {
                        setState(() {
                          _selectedRecipe = recipe;
                          isSelected = true;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        isSelected
                            ? Text(_selectedRecipe!.name,
                                style: const TextStyle(
                                  color: AppColors.Green,
                                  fontWeight: FontWeight.bold,
                                ))
                            : Text("Please select a recipe",
                                style: TextStyle(
                                    color: AppColors.DarkGray,
                                    fontSize: scaleFont(context) * 16)),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            color: AppColors.DarkGray),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: scaleHeight(context) * 30),
                    child: CompleteButton(
                        title: 'Done',
                        onPressedFunc: () async {
                          if (_titleTextController.text.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Please enter title',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.Red,
                              colorText: AppColors.White,
                              margin: const EdgeInsets.all(10),
                              borderRadius: 10,
                            );
                            return;
                          }
                          if (_selectedRecipe == null) {
                            Get.snackbar(
                              'Error',
                              'Please select a recipe',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.Red,
                              colorText: AppColors.White,
                              margin: const EdgeInsets.all(10),
                              borderRadius: 10,
                            );
                            return;
                          }
                          await createMeal(MealInput(
                              title: _titleTextController.text,
                              memo: _descriptionTextController.text,
                              date: dateTime,
                              recipeId: _selectedRecipe!.id,
                              photo: PhotoInput.fromXFile(props.mealImage)));
                          Get.back();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
