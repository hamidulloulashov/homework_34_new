class FirstPageModel {
  final String image, title, subtitle;
  final int id, order;
  FirstPageModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.order,
  });
  factory FirstPageModel.fromJson(Map<String, dynamic> json) {
    return FirstPageModel(
      id: json["id"],
      subtitle: json["subtitle"],
      order: json["order"],
      image: json["image"],
      title: json["title"],
    );
  }
}
