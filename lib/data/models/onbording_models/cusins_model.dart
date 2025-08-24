class CusinsModel {
  final String image, title;
  final int id;
  CusinsModel({required this.id, required this.image, required this.title});
  factory CusinsModel.fromJson(Map<String, dynamic> json) {
    return CusinsModel(
      id: json["id"],
      image: json["image"],
      title: json["title"],
    );
  }
}
