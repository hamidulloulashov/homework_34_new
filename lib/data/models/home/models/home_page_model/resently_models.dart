class ResentlyModels {
  final String photo, title, description;
  final int timeRequired;
  final double rating;

  ResentlyModels({
    required this.photo,
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.rating,
  });

  factory ResentlyModels.fromJson(Map<String, dynamic> json) {
    return ResentlyModels(
      photo: json['photo'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      timeRequired: json['timeRequired'] ?? 0,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : (json['rating'] ?? 0.0),
    );
  }
}
