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
        return windows;
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
    apiKey: 'AIzaSyA1ts2jI56sBblzphknQe1Zzqm90eRaIu0',
    appId: '1:1070135221623:web:e8307a5c3ca2744bed9572',
    messagingSenderId: '1070135221623',
    projectId: 'mantenimiento-75f12',
    authDomain: 'mantenimiento-75f12.firebaseapp.com',
    storageBucket: 'mantenimiento-75f12.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCvEHm9VN6r9o3CiwEtz8JCYwZSfF0hiw',
    appId: '1:1070135221623:android:b85fc872fd4cd5b2ed9572',
    messagingSenderId: '1070135221623',
    projectId: 'mantenimiento-75f12',
    storageBucket: 'mantenimiento-75f12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAqGxECfsK6leS8TLW1bJJ14G0knYHpvw',
    appId: '1:1070135221623:ios:d0d265c9f49896c5ed9572',
    messagingSenderId: '1070135221623',
    projectId: 'mantenimiento-75f12',
    storageBucket: 'mantenimiento-75f12.appspot.com',
    iosBundleId: 'com.example.flutterGamerMvvm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAqGxECfsK6leS8TLW1bJJ14G0knYHpvw',
    appId: '1:1070135221623:ios:d0d265c9f49896c5ed9572',
    messagingSenderId: '1070135221623',
    projectId: 'mantenimiento-75f12',
    storageBucket: 'mantenimiento-75f12.appspot.com',
    iosBundleId: 'com.example.flutterGamerMvvm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1ts2jI56sBblzphknQe1Zzqm90eRaIu0',
    appId: '1:1070135221623:web:7ee66e995e31d394ed9572',
    messagingSenderId: '1070135221623',
    projectId: 'mantenimiento-75f12',
    authDomain: 'mantenimiento-75f12.firebaseapp.com',
    storageBucket: 'mantenimiento-75f12.appspot.com',
  );

}