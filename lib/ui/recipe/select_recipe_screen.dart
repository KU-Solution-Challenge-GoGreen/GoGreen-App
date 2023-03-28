import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/components/textinput_title.dart';
import 'package:gogreen_client/constants/enums.dart';
import 'package:gogreen_client/models/recipe_summary.dart';
import 'package:gogreen_client/ui/recipe/add_recipe_screen.dart';
import 'package:gogreen_client/ui/recipe/recipe_info_screen.dart';

import '../../components/complete_button.dart';
import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../controller/recipe_controller.dart';

class SelectRecipeProps {
  final RecipeSummary? selectedRecipe;

  SelectRecipeProps(this.selectedRecipe);
}

class SelectRecipeScreen extends StatefulWidget {
  const SelectRecipeScreen({super.key});

  @override
  State<SelectRecipeScreen> createState() => _SelectRecipeScreenState();
}

class _SelectRecipeScreenState extends State<SelectRecipeScreen>
    with TickerProviderStateMixin {
  late TabController _recipeTabController;

  late Future<List<RecipeSummary>> myRecipesFuture;
  late Future<List<RecipeSummary>> scrapedRecipesFuture;

  final TextEditingController _searchTextController = TextEditingController();

  final SelectRecipeProps propsValue = Get.arguments;
  RecipeSummary? _selectedRecipe;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _recipeTabController = TabController(length: 2, vsync: this);
    _selectedRecipe = propsValue.selectedRecipe;
    fetchRecipes();
  }

  void fetchRecipes() {
    myRecipesFuture =
        getRecipesByUserId(FirebaseAuth.instance.currentUser!.uid);
    scrapedRecipesFuture = getBookmarkedRecipes();
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
          leading: BackButton(
            color: AppColors.White,
            onPressed: () {
              Get.back<RecipeSummary?>(
                result: _selectedRecipe,
              );
            },
          ),
          title: const Text("Select Recipe"),
          titleTextStyle: TextStyle(
              color: AppColors.White,
              fontSize: scaleFont(context) * 18,
              fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(
                scaleWidth(context) * 24, 0, scaleWidth(context) * 24, 0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TextInputTitle(
                        title: 'Please select a recipe to add to your meal.',
                        isEssential: false),
                    SizedBox(
                      height: scaleHeight(context) * 35,
                      child: TextField(
                        controller: _searchTextController,
                        onChanged: (text) {
                          setState(() {
                            //내용이 없어도 setState자체가 실행되어 검색됨
                          });
                        },
                        style: TextStyle(
                            fontSize: scaleFont(context) * 16,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.normal,
                            color: AppColors.Black),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.DarkGray)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.Green, width: 2.0),
                          ),
                          hintText: 'Search recipe...',
                          hintStyle: TextStyle(color: AppColors.DarkGray),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.Green,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: scaleHeight(context) * 15,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: AppColors.DarkGray,
                              width: 2.0,
                            ),
                          )),
                        ),
                        TabBar(
                          indicator: const BoxDecoration(
                              color: AppColors.LightGreen,
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.Green, width: 3.0))),
                          controller: _recipeTabController,
                          labelColor: AppColors.Green,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: AppColors.DarkGray,
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          tabs: const [
                            Tab(
                              text: 'My Recipes',
                            ),
                            Tab(
                              text: 'Scraped Recipes',
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: scaleHeight(context) * 300,
                      child: TabBarView(
                        controller: _recipeTabController,
                        children: [
                          FutureBuilder(
                            future: myRecipesFuture,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<RecipeSummary>> snapshot) {
                              if (snapshot.hasData) {
                                return _recipeList(
                                    _searchedRecipes(snapshot.data!),
                                    RecipeType.My);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          FutureBuilder(
                            future: scrapedRecipesFuture,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<RecipeSummary>> snapshot) {
                              if (snapshot.hasData) {
                                return _recipeList(
                                    _searchedRecipes(snapshot.data!),
                                    RecipeType.Scraped);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const AddRecipeScreen())
                              ?.then((_) => setState(() {
                                    fetchRecipes();
                                  }));
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(AppColors.LightGreen),
                        ),
                        child: SizedBox(
                          width: scaleWidth(context) * 160,
                          height: scaleHeight(context) * 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.add_circle_outline_rounded,
                                  color: AppColors.Black),
                              Text(
                                'Add my Recipe',
                                style: TextStyle(
                                    color: AppColors.Black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: scaleFont(context) * 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Selected recipe: ',
                        style: TextStyle(
                          color: AppColors.Black,
                          fontWeight: FontWeight.bold,
                          fontSize: scaleFont(context) * 18,
                        ),
                      ),
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
                      onPressed: () {
                        isSelected
                            ? {
                                Get.to(() => const RecipeInfoScreen(),
                                    arguments: RecipeInfoProps(
                                      recipeId: _selectedRecipe!.id,
                                    ))?.then((value) {
                                  fetchRecipes();
                                  setState(() {});
                                })
                              }
                            : null;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _recipeTitle(),
                          isSelected
                              ? const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.Green,
                                )
                              : const Icon(null),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: scaleHeight(context) * 30),
                    child: CompleteButton(
                      title: "select recipe",
                      onPressedFunc: () {
                        Get.back<RecipeSummary?>(
                          result: _selectedRecipe,
                        );
                      },
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

  Widget _recipeTitle() {
    if (isSelected == false) {
      return Text(
        'Please select a recipe',
        style: TextStyle(
          fontSize: scaleFont(context) * 16,
          color: AppColors.DarkGray,
        ),
      );
    } else {
      return Text(
        _selectedRecipe!.name,
        style: TextStyle(
          color: AppColors.Green,
          fontWeight: FontWeight.bold,
          fontSize: scaleFont(context) * 16,
        ),
      );
    }
  }

  Widget _recipeList(List<RecipeSummary> recipeData, RecipeType recipeType) {
    return ListView.builder(
        itemCount: recipeData.length,
        itemExtent: scaleHeight(context) * 60,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final alreadySelected = _selectedRecipe?.id == recipeData[index].id;
          return ListTile(
            title: Text(recipeData[index].name,
                style: TextStyle(
                  fontSize: scaleFont(context) * 18,
                )),
            leading: alreadySelected
                ? const Icon(Icons.check_circle_rounded, color: AppColors.Green)
                : const Icon(null),
            trailing: //Icon(Icons.arrow_forward_ios_rounded),
                IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                Get.to(() => const RecipeInfoScreen(),
                    arguments: RecipeInfoProps(recipeId: recipeData[index].id));
              },
            ),
            selected: _selectedRecipe?.id == recipeData[index].id,
            selectedColor: AppColors.Green,
            selectedTileColor: AppColors.LightGreen,
            onTap: () {
              setState(() {
                if (alreadySelected) {
                  _selectedRecipe = null;
                  isSelected = false;
                } else {
                  _selectedRecipe = recipeData[index];
                  isSelected = true;
                }
              });
            },
          );
        });
  }

  List<RecipeSummary> _searchedRecipes(List<RecipeSummary> recipeData) {
    if (_searchTextController.text == '') {
      return recipeData;
    } else {
      List<RecipeSummary> filteredList = recipeData.where((element) {
        return element.name.contains(_searchTextController.text);
      }).toList();
      return filteredList;
    }
  }
}
