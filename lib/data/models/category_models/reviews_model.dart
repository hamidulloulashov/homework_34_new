class UserModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        profilePhoto: json['profilePhoto'] ?? '',
        username: json['username'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
      );

  toJson() {}
}

class ReviewsModel {
  final int id;
  final String title;
  final String photo;
  final double rating;
  final int reviewsCount;
  final UserModel user;

  ReviewsModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        id: json['id'],
        title: json['title'] ?? '',
        photo: json['photo'] ?? '',
        rating: (json['rating'] ?? 0).toDouble(),
        reviewsCount: json['reviewsCount'] ?? 0,
        user: UserModel.fromJson(json['user'] ?? {}),
      );
}

