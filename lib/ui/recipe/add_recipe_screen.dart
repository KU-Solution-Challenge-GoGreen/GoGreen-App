import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/models/ingredient.dart';
import 'package:gogreen_client/ui/recipe/select_ingredients_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/complete_button.dart';
import '../../components/custom_textinput.dart';
import '../../components/error.toast.dart';
import '../../components/textinput_title.dart';
import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../controller/recipe_controller.dart';
import '../../models/input/photo_input.dart';
import '../../models/input/recipe_input.dart';
import '../../models/input/step_input.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _recipeNameTextController =
      TextEditingController();
  final TextEditingController _durationTextController = TextEditingController();

  final List<XFile?> _photoList = [null];
  final List<TextEditingController> _textControllerList = [
    TextEditingController(),
  ];
  static XFile? _pickedFile;

  List<Ingredient> _selectedIngredients = [];

  @override
  void initState() {
    super.initState();
  }

  void refresh() {
    setState(() {});
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
          actions: <Widget>[
            TextButton(
              child: Text(
                'Done',
                style: TextStyle(
                  color: AppColors.White,
                  fontSize: scaleFont(context) * 16,
                ),
              ),
              onPressed: () {},
            ),
          ],
          title: const Text("Add Recipe"),
          titleTextStyle: TextStyle(
              color: AppColors.White,
              fontSize: scaleFont(context) * 18,
              fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(scaleWidth(context) * 24,
                scaleHeight(context) * 12, scaleWidth(context) * 24, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const TextInputTitle(
                      title: 'Recipe name', isEssential: false),
                  customTextInput(
                    hintText: 'Please enter recipe name.',
                    textController: _recipeNameTextController,
                    minLine: 1,
                    maxLine: 1,
                  ),
                  const TextInputTitle(
                      title: 'Ingredients', isEssential: false),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(
                          width: 1.0, color: AppColors.DarkGray),
                      padding: EdgeInsets.all(scaleHeight(context) * 16),
                      backgroundColor: AppColors.White,
                    ),
                    onPressed: () async {
                      List<Ingredient>? value = await Get.to(
                          () => const SelectIngredientsScreen(),
                          arguments: _selectedIngredients);

                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedIngredients = value;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Select ingredients",
                            style: TextStyle(
                                color: AppColors.DarkGray,
                                fontSize: scaleFont(context) * 16)),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            color: AppColors.DarkGray),
                      ],
                    ),
                  ),
                  Wrap(
                    children: _selectedIngredients.map(
                      (ingredient) {
                        return _ingredientElement(ingredient);
                      },
                    ).toList(),
                  ),
                  const TextInputTitle(
                      title: 'Cooking time', isEssential: false),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: scaleWidth(context) * 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          controller: _durationTextController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.DarkGray)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.Green,
                                width: 2,
                              ),
                            ),
                            counterText: '',
                          ),
                        ),
                      ),
                      const Text(' minutes'),
                    ],
                  ),
                  const TextInputTitle(title: 'Steps', isEssential: false),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._getSteps(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        _textControllerList.add(TextEditingController());
                        _photoList.add(null);
                        setState(() {});
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(AppColors.LightGreen),
                      ),
                      child: SizedBox(
                        width: scaleWidth(context) * 111,
                        height: scaleHeight(context) * 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.add_circle_outline_rounded,
                                color: AppColors.Green),
                            Text(
                              'Add step',
                              style: TextStyle(
                                  color: AppColors.Green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: scaleFont(context) * 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: scaleHeight(context) * 30),
                    child: CompleteButton(
                      title: 'add recipe',
                      onPressedFunc: () async {
                        inputValidation();
                        List<StepInput> stepsList = _textControllerList
                            .asMap()
                            .map((i, e) => MapEntry(
                                i,
                                StepInput(
                                    description: e.text,
                                    photo: _photoList[i] != null
                                        ? PhotoInput.fromXFile(_photoList[i]!)
                                        : null)))
                            .values
                            .toList();

                        RecipeInput recipeInput = RecipeInput(
                            name: _recipeNameTextController.text,
                            ingredientIds:
                                _selectedIngredients.map((e) => e.id).toList(),
                            duration: int.parse(_durationTextController.text),
                            steps: stepsList);

                        await createRecipe(recipeInput);

                        //stepsList를 백엔드에 보냄
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void inputValidation() {
    if (_recipeNameTextController.text.isEmpty) {
      errorToast('Please enter recipe name.');
      return;
    }

    if (_selectedIngredients.isEmpty) {
      errorToast('Please select ingredients.');
      return;
    }

    if (_durationTextController.text.isEmpty) {
      errorToast('Please enter cooking time.');
      return;
    }

    // step 중에 하나라도 desciption이 없으면 안됨
    for (int i = 0; i < _textControllerList.length; i++) {
      if (_textControllerList[i].text.isEmpty) {
        errorToast('Please enter step description.');
        return;
      }
    }
  }

  List<Widget> _getSteps() {
    List<Widget> stepsTextFields = [];
    for (int i = 0; i < _textControllerList.length; i++) {
      stepsTextFields.addAll([
        _stepItem(i),
      ]);
    }
    return stepsTextFields;
  }

  void photoBottomModal(int index) async {
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
                    label: Text(
                      "Camera",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontFamily: 'roboto',
                          fontSize: scaleFont(context) * 16,
                          fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        iconColor: MaterialStateProperty.all(AppColors.Green),
                        iconSize:
                            MaterialStateProperty.all(scaleWidth(context) * 24),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.LightGray),
                        fixedSize: MaterialStateProperty.all(Size(
                            scaleWidth(context) * 140,
                            scaleHeight(context) * 70))),
                    onPressed: () async {
                      await _getImageFromCamera();
                      if (_pickedFile != null) {
                        _photoList[index] = _pickedFile;
                      }
                    },
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(
                      Icons.collections,
                    ),
                    label: Text(
                      "Gallery",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontFamily: 'roboto',
                          fontSize: scaleFont(context) * 16,
                          fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        iconColor: MaterialStateProperty.all(AppColors.Green),
                        iconSize:
                            MaterialStateProperty.all(scaleWidth(context) * 24),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.LightGray),
                        fixedSize: MaterialStateProperty.all(Size(
                            scaleWidth(context) * 140,
                            scaleHeight(context) * 70))),
                    onPressed: () async {
                      await _getImageFromGallery();
                      if (_pickedFile != null) {
                        _photoList[index] = _pickedFile;
                      }
                    },
                  ),
                ]),
          );
        });
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

  Widget _stepItem(index) {
    return Column(children: <Widget>[
      Row(
        children: [
          Text(
            'Step ${index + 1}.',
            style: TextStyle(
              fontSize: scaleFont(context) * 16,
            ),
          ),
          if (index != 0)
            IconButton(
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
                color: AppColors.Red,
              ),
              onPressed: () {
                _textControllerList.removeAt(index);
                _photoList.removeAt(index);
                refresh();
              },
            ),
        ],
      ),
      Container(
        width: scaleWidth(context) * 312,
        padding: EdgeInsets.symmetric(
          vertical: scaleHeight(context) * 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: scaleWidth(context) * 246,
              constraints: BoxConstraints(
                minHeight: scaleWidth(context) * 60,
              ),
              child: customTextInput(
                textController: _textControllerList[index],
                hintText: 'Please enter recipe descriptions',
                minLine: 2,
                maxLine: null,
              ),
            ),
            SizedBox(
              width: scaleWidth(context) * 60,
              height: scaleWidth(context) * 60,
              child: _photoList[index] != null
                  ? InkWell(
                      onTap: () {
                        photoBottomModal(index);
                      },
                      radius: 5.0,
                      child: Ink.image(
                        image: FileImage(File(_photoList[index]!.path)),
                        fit: BoxFit.cover,
                      ),
                    )
                  : TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.LightGreen,
                          fixedSize: Size(scaleHeight(context) * 60,
                              scaleHeight(context) * 60)),
                      onPressed: () {
                        photoBottomModal(index);
                      },
                      child: const Icon(Icons.camera_enhance,
                          color: AppColors.Green),
                    ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _ingredientElement(Ingredient ingredient) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) * 5,
          vertical: scaleHeight(context) * 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: scaleHeight(context) * 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.Green, width: 1)),
        child: FittedBox(
          child: Row(
            children: <Widget>[
              Text(
                ingredient.name,
                style: TextStyle(
                    color: AppColors.Green, fontSize: scaleFont(context) * 14),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIngredients.remove(ingredient);
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: AppColors.DarkGray,
                  size: scaleWidth(context) * 15,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
