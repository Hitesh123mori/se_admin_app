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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDpKTVVFuDdMxEJvuVOV-APvZdUm40jGTM',
    appId: '1:11046890544:web:218a22f2c7fa4e21c151f5',
    messagingSenderId: '11046890544',
    projectId: 'savyasachi-engineering',
    authDomain: 'savyasachi-engineering.firebaseapp.com',
    storageBucket: 'savyasachi-engineering.appspot.com',
    measurementId: 'G-H3Y0H62FP8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXSEvfTJ1gxkT_e38RbKPDVXfXo4svJCw',
    appId: '1:11046890544:android:83337dff57dd4ff5c151f5',
    messagingSenderId: '11046890544',
    projectId: 'savyasachi-engineering',
    storageBucket: 'savyasachi-engineering.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDl2fzeSZ8GROrYic_DNE_jeiLmlFO5ik',
    appId: '1:11046890544:ios:e6a3578971482f62c151f5',
    messagingSenderId: '11046890544',
    projectId: 'savyasachi-engineering',
    storageBucket: 'savyasachi-engineering.appspot.com',
    iosBundleId: 'com.example.seAdminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDl2fzeSZ8GROrYic_DNE_jeiLmlFO5ik',
    appId: '1:11046890544:ios:009e2e827b148d83c151f5',
    messagingSenderId: '11046890544',
    projectId: 'savyasachi-engineering',
    storageBucket: 'savyasachi-engineering.appspot.com',
    iosBundleId: 'com.example.seAdminApp.RunnerTests',
  );
}
