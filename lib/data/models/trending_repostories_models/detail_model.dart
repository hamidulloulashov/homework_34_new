import 'users_model.dart';

class DetailModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final String difficulty;
  final double rating;
  final int reviewsCount;
  final User user;

  DetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.difficulty,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    photo: json['photo'] ?? '',
    timeRequired: json['timeRequired'] ?? 0,
    difficulty: json['difficulty'] ?? '',
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    reviewsCount: json['reviewsCount'] ?? 0,
    user: User.fromJson(json['user'] ?? {}),
  );
}
