import 'dart:ui';
import 'package:gogreen_client/constants/colors.dart';

enum ResponseStatus { success, error }

enum RecipeType { None, My, Scraped }

enum CategoryType {
  vegetable('vegetable', '21ae0459-85ae-4616-af06-61ca4730221c', '채소'),
  dairy('dairy', 'a930bdc3-c67c-43a9-98af-1531206601ef', '유제품'),
  egg('egg', '4c45a8e7-0680-45ec-9500-98947520dab5', '계란'),
  seafood('seafood', 'dc4d6d89-d40e-44ef-89b4-6a97724ff29e', '해산물'),
  poultry('poultry', '18bba908-745c-4d3b-9505-ac27926a4b0b', '닭고기'),
  meat('meat', '9d383b29-ebda-47b9-889e-941ec7bcf95e', '고기'),
  undefined('undefined', '', '');

  const CategoryType(this.name, this.id, this.nameKo);
  final String name;
  final String id;
  final String nameKo;

  factory CategoryType.getById(String id) {
    return CategoryType.values.singleWhere((value) => value.id == id,
        orElse: () => CategoryType.undefined);
  }
}

enum VeganType {
  vegan('Vegan', 'c044d7e6-788e-4331-9a92-8cc3a8e1b12a',
      [CategoryType.vegetable]),
  lacto('Lacto', '270e7138-ddbb-4ab9-a16b-3244bb0795be',
      [CategoryType.vegetable, CategoryType.dairy]),
  ovo('Ovo', 'f4fe3545-45da-45b6-aec0-1d0e42d84b34',
      [CategoryType.vegetable, CategoryType.egg]),
  lactoovo('Lacto-Ovo', '6c5a8566-cc90-4bb5-bbb8-bb61e2a99138',
      [CategoryType.vegetable, CategoryType.dairy, CategoryType.egg]),
  pesco('Pesco', 'dd799cd5-87d0-4d3a-9d00-1cb64635b1b0', [
    CategoryType.vegetable,
    CategoryType.dairy,
    CategoryType.egg,
    CategoryType.seafood
  ]),
  pollo('Pollo', '60c43d08-ee18-4de5-b318-3219012011e9', [
    CategoryType.vegetable,
    CategoryType.dairy,
    CategoryType.egg,
    CategoryType.seafood,
    CategoryType.poultry
  ]),
  flexitarian('Flexitarian', 'fc51eacc-5465-41ab-a8dc-9dbbff457fc5', [
    CategoryType.vegetable,
    CategoryType.dairy,
    CategoryType.egg,
    CategoryType.seafood,
    CategoryType.poultry,
    CategoryType.meat
  ]),
  undefined('undefined', '', []);

  const VeganType(this.name, this.id, this.categoryIds);
  final String name;
  final String id;
  final List<CategoryType> categoryIds;

  factory VeganType.getById(String id) {
    return VeganType.values.singleWhere((value) => value.id == id,
        orElse: () => VeganType.undefined);
  }
}

enum CarbonFootPrintAmountType {
  good('good', 0, AppColors.Green),
  normal('normal', 30, AppColors.Yellow),
  bad('bad', 60, AppColors.Pink),
  undefined('undefined', -1, AppColors.DarkGray);

  const CarbonFootPrintAmountType(this.status, this.ratio, this.barColor);
  final String status;
  final int ratio;
  final Color barColor;

  factory CarbonFootPrintAmountType.getByRatio(num ratio) {
    switch (ratio ~/ 10) {
      case 10:
      case 9:
      case 8:
      case 7:
      case 6:
        return CarbonFootPrintAmountType.bad;
      case 5:
      case 4:
      case 3:
        return CarbonFootPrintAmountType.normal;
      case 2:
      case 1:
      case 0:
        return CarbonFootPrintAmountType.good;
      default:
        return CarbonFootPrintAmountType.undefined;
    }
  }
}
