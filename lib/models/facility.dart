import 'package:se_admin_app/apis/FirebaseAPI.dart';

class Facility {
  static final _collectionRef = FirebaseAPI.dbAPI.collection("facilities");

  Facility({
    required this.name,
    required this.imagePath,
    required this.discription,
    this.id = ""
  });
  late String name;
  late String imagePath;
  late String discription;
  late String id;

  Facility.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    imagePath = json['imagePath'] ?? '';
    discription = json['discription'] ?? '';
    id = json["id"]??"";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['discription'] = discription;
    data["id"] = id;
    return data;
  }

  static Future<List<Facility>>? getList(){

    _collectionRef.get().then((value) {
      List<Facility> list = [];

      value.docs.forEach((element) {
        final map = element.data();
        map["id"] = element.id;
        print(map);
        list.add(Facility.fromJson(map));
      });
      return list;
    });
    return null;
  }

  bool addToDB(){
    _collectionRef.add(toJson())
        .then((value) {
      id = value.id;
      print("added");
      return true;
    })
        .onError((error, stackTrace) {
      print(error);
      return false;
    });
    return false;
  }
}