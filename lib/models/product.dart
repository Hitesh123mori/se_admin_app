import 'package:se_admin_app/apis/FirebaseAPI.dart';

class Product {
  static final _collectionRef = FirebaseAPI.dbAPI.collection("products");

  Product({
    required this.name,
    required this.imagePath,
    this.id = "",
  });
  late String name;
  late String imagePath;
  late String id;

  Product.fromJson(Map<String, dynamic> json) {
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

  static Future<List<Product>>? getList(){
    print("fetching products ... ");
    _collectionRef.get().then((value) {
      List<Product> list = [];

      value.docs.forEach((element) {
        final map = element.data();
        map["id"] = element.id;
        print(map);
        list.add(Product.fromJson(map));
      });
      print("complete.");
      return list;
    }).onError((error, stackTrace) => []);
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