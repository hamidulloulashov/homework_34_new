class SecondPageModels {
  final String image, title, subtitle;
  final int id, order;
  SecondPageModels({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.order,
  });
  factory SecondPageModels.fromJson(Map<String, dynamic> json) {
    return SecondPageModels(
      id: json["id"],
      subtitle: json["subtitle"],
      order: json["order"],
      image: json["image"],
      title: json["title"],
    );
  }
}
