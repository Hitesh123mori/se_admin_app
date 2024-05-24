import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:se_admin_app/apis/FirebaseAPIs.dart';

class InfoProvider extends ChangeNotifier{
  final _colRef = FirebaseAPIs.dbAPI.collection("primaryInfo");

  Map<String, bool> options = {
    "About Us": true,
    "Vision": false,
    "Mission": false,
    "Director Information": false,
    "Contact Us": false,
  };

  String current = "About Us";

  Map<String, TextEditingController> infoTEC = {};

  void updateCurrent(String option){
    options[current] = false;
    current = option;
    options[current] = true;
    notifyListeners();
  }

  String getKey() {
    return current.toLowerCase().replaceAll(" ", "_");
  }

  Future<void> update(String key, String value)async {
    final docString = getKey();

    await _colRef.doc(docString).update({key: value});

  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getInfo() async{
    final docString = current.toLowerCase().replaceAll(" ", "_");

    return await _colRef.doc(docString).get().then((value) => value);
  }

  void notify(){
    notifyListeners();
  }

}