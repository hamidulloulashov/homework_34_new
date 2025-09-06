class MenyuModels {
  final String title;
  MenyuModels({required this.title});

  factory MenyuModels.fromJson(Map<String, dynamic> json) {
    return MenyuModels(title: json['title']);
  }
}
