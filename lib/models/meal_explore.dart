class MealExplore {
  late String id = "";
  late String userId = "";
  late String title = "";
  late String memo = "";
  late String recipeName = "";
  late String categoryIds = "";
  late String? photo = "";
  late DateTime date = DateTime.now();
  late double carbonFootprint = 0;

  MealExplore(
      {required this.id,
      required this.userId,
      required this.title,
      required this.memo,
      required this.recipeName,
      required this.categoryIds,
      this.photo,
      required this.date,
      required this.carbonFootprint});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "memo": memo,
      "recipeName": recipeName,
      "categoryIds": categoryIds,
      "photo": photo,
      "date": date,
      "carbonFootprint": carbonFootprint
    };
  }

  MealExplore.fromJson(Map<String, dynamic> json) {
    id:
    json['id'] as String;
    userId:
    json['userId'] as String;
    title:
    json['title'] as String;
    memo:
    json['memo'] as String;
    recipeName:
    json['recipeName'] as String;
    categoryIds:
    json['categoryIds'] as String;
    photo:
    json['photo'];
    date:
    json['date'] as DateTime;
    carbonFootprint:
    json['carbonFootprint'] as double;
  }
}
