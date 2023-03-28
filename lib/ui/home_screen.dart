import 'package:flutter/material.dart';
import 'package:gogreen_client/constants/colors.dart';
import 'package:gogreen_client/ui/account/my_profile_screen.dart';
import 'package:gogreen_client/ui/explore/explore_screen.dart';
import 'package:gogreen_client/ui/recipe/add_recipe_screen.dart';

import 'meal/daily_meal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const DailyMealScreen(),
    ExploreScreen(), //to-be : ExploreScreen
    const MyProfileScreen(), //to-be : MyProfileScreen
  ];

  void _onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.White,
        selectedItemColor: AppColors.Green,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.energy_savings_leaf_rounded),
              label: "Daily Diet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Profile"),
        ],
      ),
    );
  }
}
