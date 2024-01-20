/// id : "a"
/// path : "p"

class ImageModel {
  ImageModel({
      this.id, 
      this.path,});

  ImageModel.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
  }
  String? id;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    return map;
  }

}