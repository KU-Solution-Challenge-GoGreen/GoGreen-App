import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/enums.dart';

class SetFilterScreen extends StatefulWidget {
  const SetFilterScreen({super.key});

  @override
  State<SetFilterScreen> createState() => _SetFilterScreenState();
}

class _SetFilterScreenState extends State<SetFilterScreen> {
  String? _selectedVeganTypeId;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadVeganType();
  }

  void _loadVeganType() async {
    _prefs = await SharedPreferences.getInstance();
    _selectedVeganTypeId = _prefs.getString('selected_vegan_type_id');
    if (_selectedVeganTypeId == null) {
      _selectedVeganTypeId = VeganType.flexitarian.id;
      persist(_selectedVeganTypeId!);
    }
    setState(() {});
  }

  void persist(String value) {
    setState(() {
      _selectedVeganTypeId = value;
    });
    _prefs.setString('selected_vegan_type_id', _selectedVeganTypeId!);
  }

  void _changeVeganType(VeganType vegantype) async {
    setState(() {
      _selectedVeganTypeId = vegantype.id;
      _prefs.setString('selected_vegan_type_id', _selectedVeganTypeId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.Green,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/x_icon.svg',
            color: AppColors.White,
            width: scaleWidth(context) * 25,
            height: scaleHeight(context) * 25,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text("Filter Types"),
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
              children: [
                Text('Select types of vegetarians to filter.',
                    style: text.headlineSmall),
                Container(
                  padding: EdgeInsets.only(
                    top: scaleHeight(context) * 12,
                  ),
                  width: scaleWidth(context) * 312,
                  height: scaleHeight(context) * 500,
                  child: _veganTypeListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<VeganType> veganTypeList = [
    VeganType.vegan,
    VeganType.lacto,
    VeganType.ovo,
    VeganType.lactoovo,
    VeganType.pesco,
    VeganType.pollo,
    VeganType.flexitarian,
  ];

  Widget _veganTypeListView() {
    return ListView.builder(
      itemCount: veganTypeList.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final alreadySelected = _selectedVeganTypeId == veganTypeList[index].id;
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                veganTypeList[index].name,
                style: TextStyle(
                  fontSize: scaleFont(context) * 18,
                ),
              ),
              SizedBox(
                width: scaleWidth(context) * 116,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _categoryIconList(
                      _categoryList(veganTypeList[index]), context),
                ),
              ),
            ],
          ),
          leading: alreadySelected
              ? const Icon(Icons.check_circle_rounded, color: AppColors.Green)
              : const Icon(null),
          selected: alreadySelected,
          selectedColor: AppColors.Green,
          selectedTileColor: AppColors.LightGreen,
          onTap: () {
            setState(() {
              if (!alreadySelected) {
                _changeVeganType(veganTypeList[index]);
              }
            });
          },
        );
      },
    );
  }

  Map<String, bool> _categoryList(VeganType value) {
    late Map<String, bool> categoryList = {
      'vegetable': true,
      'dairy': false,
      'egg': false,
      'seafood': false,
      'poultry': false,
      'meat': false
    };
    for (var category in value.categoryIds) {
      categoryList[CategoryType.getById(category.id).name] = true;
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
}
