class LeaveModel {
  final String title, photo;
final int id;

  LeaveModel({required this.title, required this.photo, required this.id});
  factory LeaveModel.fromjson(Map< String , dynamic> json){
    return LeaveModel(title: json["title"], photo: json["photo"], id: json["id"]);
  }
}