class ChefsModels {
  final int id;
  final String firstName;
  final String? photo;

  ChefsModels({required this.id, required this.firstName, this.photo});

  factory ChefsModels.fromJson(Map<String, dynamic> json) {
    return ChefsModels(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      photo: json['photo'],
    );
  }
}
