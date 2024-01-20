import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
class FirebaseAPI{
  static final firebaseAPI = Firebase.initializeApp();
  static final dbAPI = FirebaseFirestore.instance;
  static final fireStoreAPI = FirebaseStorage.instance.refFromURL("gs://savyasachi-engineering.appspot.com");
  }