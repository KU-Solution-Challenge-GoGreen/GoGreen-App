import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/controller/recipe_controller.dart';
import 'package:gogreen_client/models/recipe_summary.dart';
import 'package:gogreen_client/ui/recipe/recipe_info_screen.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import 'add_recipe_screen.dart';

class MyRecipeScreen extends StatefulWidget {
  const MyRecipeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyRecipeScreenState();
}

class _MyRecipeScreenState extends State<MyRecipeScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchTextController = TextEditingController();
  late TabController _recipeTabController;

  late Future<List<RecipeSummary>> myRecipesFuture;
  late Future<List<RecipeSummary>> scrapRecipesFuture;

  @override
  void initState() {
    super.initState();
    fetchRecipeData();
    _recipeTabController = TabController(length: 2, vsync: this);
  }

  void fetchRecipeData() {
    myRecipesFuture =
        getRecipesByUserId(FirebaseAuth.instance.currentUser!.uid);
    scrapRecipesFuture = getBookmarkedRecipes();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        leading: const BackButton(color: AppColors.White),
        title: const Text("Recipe List"),
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
                addRecipeButton(context),
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
                        fontWeight: FontWeight.normal,
                        color: AppColors.Black),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.DarkGray)),
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
                      FutureBuilder<List<RecipeSummary>>(
                        future: myRecipesFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<RecipeSummary>> snapshot) {
                          if (snapshot.hasData) {
                            return _recipeList(
                              _searchedRecipes(snapshot.data!),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      FutureBuilder(
                        future: scrapRecipesFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<RecipeSummary>> snapshot) {
                          if (snapshot.hasData) {
                            return _recipeList(
                              _searchedRecipes(snapshot.data!),
                            );
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recipeList(List<RecipeSummary> recipeList) {
    return ListView.builder(
        itemCount: recipeList.length,
        itemExtent: scaleHeight(context) * 60,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipeList[index].name,
                style: TextStyle(
                  fontSize: scaleFont(context) * 18,
                )),
            leading: const Icon(null),
            trailing: //Icon(Icons.arrow_forward_ios_rounded),
                IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                Get.to(() => const RecipeInfoScreen(),
                    arguments: RecipeInfoProps(
                      recipeId: recipeList[index].id,
                    ))?.then((value) {
                  fetchRecipeData();
                  setState(() {});
                });
              },
            ),
          );
        });
  }

  Widget addRecipeButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Get.to(() => const AddRecipeScreen())?.then((_) => setState(() {
                fetchRecipeData();
                setState(() {});
              }));
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.LightGreen),
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
    );
  }
}
