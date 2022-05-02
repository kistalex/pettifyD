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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBVHK1wTRppsQqJLeqXis6YVawk4G9ikqU',
    appId: '1:551755239012:web:2f9519ed9807ae83f05971',
    messagingSenderId: '551755239012',
    projectId: 'petty-89e09',
    authDomain: 'petty-89e09.firebaseapp.com',
    storageBucket: 'petty-89e09.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrRHZcK-BadSsGLKg-SlhfjH4a4AVIP4U',
    appId: '1:551755239012:android:50bdef5aad047147f05971',
    messagingSenderId: '551755239012',
    projectId: 'petty-89e09',
    storageBucket: 'petty-89e09.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIrvM54rrlEjKLktcz5CoYoobp7gxaaW4',
    appId: '1:551755239012:ios:3e89f2cdc6aa3323f05971',
    messagingSenderId: '551755239012',
    projectId: 'petty-89e09',
    storageBucket: 'petty-89e09.appspot.com',
    iosClientId: '551755239012-pvv5gu10gq8uq6mdtr53vqn94cnvadfn.apps.googleusercontent.com',
    iosBundleId: 'com.example.pettify',
  );
}
