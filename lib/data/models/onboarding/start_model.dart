class StartModel {
  final String image, title, subtitle;
  final int id, order;
  StartModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.order,
  });
  factory StartModel.fromJson(Map<String, dynamic> json) {
    return StartModel(
      id: json["id"],
      subtitle: json["subtitle"],
      order: json["order"],
      image: json["image"],
      title: json["title"],
    );
  }
}
