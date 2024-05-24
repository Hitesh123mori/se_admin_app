import 'package:firebase_storage/firebase_storage.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/apis/FirebaseAPIs.dart';
import 'package:se_admin_app/models/ImageModel.dart';

class KClient {
  static final _collectionRef = FirebaseAPIs.dbAPI.collection("clients");
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

  Future<void> delete(KClientProvider provider) async {
    await _collectionRef.doc(id).delete();
    provider.notify();
  }

  Future<void> add() async {
    final docRef = _collectionRef.doc();
    id = docRef.id;
    await docRef.set(toJson());
  }


  Future<void> update()async{
    final docRef = _collectionRef.doc(id);
    docRef.update({"name": name}).onError((error, stackTrace) {
      print("#error $error $stackTrace");
    });
  }


  Future<ImageModel?> uploadImage(var image, KClientProvider kClientProvider)async {
    print("#Uploading img: id: $id");
    var imageRef = FirebaseAPIs.fireStoreAPI.child(imagePath);

    imagePath = "images/kclient/$id";
    print("#path: $imagePath");

    imageRef = FirebaseAPIs.fireStoreAPI.child("$imagePath/${FirebaseAPIs.uuid.v1()}");


      return await imageRef.putData(image)
        .then((p0) async {
      final docRef = _collectionRef.doc(id);
      return await docRef.update({"imagePath": imagePath})
          .then((value) {
        kClientProvider.notify();
        return ImageModel(fullPath: p0.ref.fullPath, uri: p0.ref.getDownloadURL(), callback: () => kClientProvider.notify());
      });
    });
    // .onError((error, stackTrace) {
    //   print("#Error: ${stackTrace}");
    // });
  }

  Future<dynamic> getImage(KClientProvider kClientProvider)async {
    final imgRef = FirebaseAPIs.fireStoreAPI.child(imagePath);

    return imgRef.list().then((value) {
      List<Reference> refs = value.items;

      print("#res: ${refs.map((e) => e.name)}");

      return refs.map((e) => ImageModel(fullPath: e.fullPath, uri: e.getDownloadURL(), callback: () => kClientProvider.notify())).toList();
    });

  }

}

