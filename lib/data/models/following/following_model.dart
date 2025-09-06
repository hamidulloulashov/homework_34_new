class FollowingModel {
  final String profilePhoto, username, firstName, lastName;
  final int id;
  FollowingModel(
    {
    required this.id, 
  required this.profilePhoto, required this.username, required this.firstName, required this.lastName,});

  factory FollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowingModel(
      id: json["id"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}
