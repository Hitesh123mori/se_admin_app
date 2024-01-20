import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> update()async{
    final docRef = _collectionRef.doc(id);
    docRef.update({"name": name}).onError((error, stackTrace) {
      print("#error $error $stackTrace");
    });
  }


  Future<void> uploadImage(var image)async {
    print("#Uploading img: id: ${id}");
    var imageRef = FirebaseAPI.fireStoreAPI.child(imagePath);

    imagePath = "images/products/$id";
    print("#path: $imagePath");

    imageRef = FirebaseAPI.fireStoreAPI.child(imagePath);


    imageRef.putData(image.data)
        .then((p0) {
      // edit in DB;
      final docRef = _collectionRef.doc(id);
      docRef.update({"imagePath": imagePath});
    }).onError((error, stackTrace) {
      print("#Error: ${stackTrace}");
    });
  }

  Future<dynamic> getImage()async {
    if (imagePath == "") return "null";
    final imgRef = FirebaseAPI.fireStoreAPI.child(imagePath);

    var url = await imgRef.getDownloadURL();

    return url;
  }

}