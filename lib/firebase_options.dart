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
    apiKey: 'AIzaSyAvI3PbVgkyM9hmkVQDamW3UimlCigIb5c',
    appId: '1:284095252361:web:5e78668392205c7bff0358',
    messagingSenderId: '284095252361',
    projectId: 'seno-card',
    authDomain: 'seno-card.firebaseapp.com',
    storageBucket: 'seno-card.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCw-c83zlasc67kaBMFmT8M5QcQMCjGV_c',
    appId: '1:284095252361:android:1579f1c75fb44906ff0358',
    messagingSenderId: '284095252361',
    projectId: 'seno-card',
    storageBucket: 'seno-card.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQz0bNrAlkvytkSTEuXayLc6Ddc-JIMGU',
    appId: '1:284095252361:ios:d2b262f19cbb1e4bff0358',
    messagingSenderId: '284095252361',
    projectId: 'seno-card',
    storageBucket: 'seno-card.appspot.com',
    iosBundleId: 'com.example.senoCard',
  );
}
