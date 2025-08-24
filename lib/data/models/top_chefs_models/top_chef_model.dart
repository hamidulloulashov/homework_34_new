class TopChefModel {
  final int id;
  final String firstName;
  final String photo;

  TopChefModel({
    required this.id,
    required this.firstName,
    required this.photo,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'firstName': firstName, 'photo': photo};
  }
}
