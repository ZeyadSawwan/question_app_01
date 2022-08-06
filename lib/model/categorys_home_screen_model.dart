class CategorysModel {
  String image;
  String categoryName;
  String questionNumbers;
  String route;
  String? description;
  CategorysModel({
    required this.categoryName,
    required this.image,
    required this.questionNumbers,
    required this.route,
    this.description,
  });
}
