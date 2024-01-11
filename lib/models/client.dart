import 'package:se_admin_app/apis/FirebaseAPI.dart';

class KClient {
  static final _collectionRef = FirebaseAPI.dbAPI.collection("clients");
  KClient({
    required this.name,
    required this.imagePath,
    this.id = ""
  });
  late String name;
  late String imagePath;
  late String id;

  KClient.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    imagePath = json['imagePath'] ?? '';
    id = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['id'] = id;
    return data;
  }

  static Future<List<KClient>>? getList(){

    _collectionRef.get().then((value) {
        List<KClient> list = [];

        value.docs.forEach((element) {
          final map = element.data();
          map["id"] = element.id;
          print(map);
          list.add(KClient.fromJson(map));
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

