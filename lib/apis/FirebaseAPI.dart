import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAPI{
  static final firebaseAPI = Firebase.initializeApp();
  static final dbAPI = FirebaseFirestore.instance;

  }