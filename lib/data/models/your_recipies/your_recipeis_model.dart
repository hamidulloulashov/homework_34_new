class YourRecipeisModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String photo;
  final double timeRequired;
  final int rating;
  YourRecipeisModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });
  factory YourRecipeisModel.fromJson(Map<String, dynamic> json) {
    return YourRecipeisModel(
      id: (json["id"] as num).toInt(),
      categoryId: (json["categoryId"] as num).toInt(),
      title: json["title"] ?? '',
      description: json["description"] ?? '',
      difficulty: json["difficulty"] ?? '',
      photo: json["photo"] ?? '',
      timeRequired: (json["timeRequired"] as num).toDouble(),
      rating: (json["rating"] as num).toInt(),
    );
  }
}
