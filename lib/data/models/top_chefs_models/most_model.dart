class MostModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePhoto;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  MostModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory MostModel.fromJson(Map<String, dynamic> json) {
    return MostModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      profilePhoto: json['profilePhoto'] ?? "",
      presentation: json['presentation'] ?? "",
      recipesCount: json['recipesCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      followerCount: json['followerCount'] ?? 0,
    );
  }
}
