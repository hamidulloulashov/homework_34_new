class CategoryModel {
  final String image, title;
  final int id;
  CategoryModel({required this.id, required this.image, required this.title});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      image: json["image"],
      title: json["title"],
    );
  }
}
