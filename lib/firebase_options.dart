// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAQ_F68otjmzcL2fnH3qyxxly2RnxRdn4g',
    appId: '1:387809275070:web:629b2e377bbf45fbad42ef',
    messagingSenderId: '387809275070',
    projectId: 'savysachi-engineering',
    authDomain: 'savysachi-engineering.firebaseapp.com',
    storageBucket: 'savysachi-engineering.appspot.com',
    measurementId: 'G-RG8QFV7DVS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFyH8pHURSsJoWTcHyAJ4rdkKBesAPqd0',
    appId: '1:387809275070:android:953da3de0dc2653ead42ef',
    messagingSenderId: '387809275070',
    projectId: 'savysachi-engineering',
    storageBucket: 'savysachi-engineering.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSW9cM7EFU3uzuPtM3uRllj-OexvKYIiU',
    appId: '1:387809275070:ios:1225bd6fdc23e35aad42ef',
    messagingSenderId: '387809275070',
    projectId: 'savysachi-engineering',
    storageBucket: 'savysachi-engineering.appspot.com',
    iosBundleId: 'com.example.seAdminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSW9cM7EFU3uzuPtM3uRllj-OexvKYIiU',
    appId: '1:387809275070:ios:21f0811da165497aad42ef',
    messagingSenderId: '387809275070',
    projectId: 'savysachi-engineering',
    storageBucket: 'savysachi-engineering.appspot.com',
    iosBundleId: 'com.example.seAdminApp.RunnerTests',
  );
}