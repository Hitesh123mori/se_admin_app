import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'package:se_admin_app/apis/FirebaseAPI.dart';
import 'package:se_admin_app/models/ImageModel.dart';

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


  Future<ImageModel?> uploadImage(var image, ProductProvider productProvider)async {
    print("#Uploading img: id: $id");
    var imageRef = FirebaseAPI.fireStoreAPI.child(imagePath);

    imagePath = "images/products/$id";
    print("#path: $imagePath");

    imageRef = FirebaseAPI.fireStoreAPI.child("$imagePath/${FirebaseAPI.uuid.v1()}");


    return await imageRef.putData(image)
        .then((p0) async {
          final docRef = _collectionRef.doc(id);
            return await docRef.update({"imagePath": imagePath})
                .then((value) {
                  productProvider.notify();
                  return ImageModel(fullPath: p0.ref.fullPath, uri: p0.ref.getDownloadURL(), callback: () => productProvider.notify());
                });
        });
        // .onError((error, stackTrace) {
        //   print("#Error: ${stackTrace}");
        // });
  }

  Future<dynamic> getImage(ProductProvider productProvider)async {
    final imgRef = FirebaseAPI.fireStoreAPI.child(imagePath);

    return imgRef.list().then((value) {
      List<Reference> refs = value.items;

      print("#res: ${refs.map((e) => e.name)}");

      return refs.map((e) => ImageModel(fullPath: e.fullPath, uri: e.getDownloadURL(), callback: () => productProvider.notify())).toList();
    });

  }


}