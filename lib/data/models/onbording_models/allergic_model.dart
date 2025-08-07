class AllergicModel {
  final String image, title;
  final int id;
  AllergicModel({required this.id, required this.image, required this.title});
  factory AllergicModel.fromJson(Map<String, dynamic> json) {
    return AllergicModel(
      id: json["id"],
      image: json["image"],
      title: json["title"],
    );
  }
}
