class CommunityModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final double rating;
  final int reviewsCount;
  final DateTime created;
  final CommunityUserModel user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      photo: json['photo'] ?? '',
      timeRequired: (json['timeRequired'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
      user: CommunityUserModel.fromJson(json['user'] ?? {}),
    );
  }
}

class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json["id"] ?? 0,
      profilePhoto: json["profilePhoto"] ?? "",
      username: json["username"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
    );
  }
}
