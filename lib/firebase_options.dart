// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyD-klAh14wAKiDsDkYqYUdtcMLKoCe3MUI',
    appId: '1:170205363897:web:90bdb7aae677c5dc5b2568',
    messagingSenderId: '170205363897',
    projectId: 'bitirme-4d4cb',
    authDomain: 'bitirme-4d4cb.firebaseapp.com',
    storageBucket: 'bitirme-4d4cb.firebasestorage.app',
    measurementId: 'G-7YXMQDCWB1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8RKnsEoC1NBiDok5oBL67cYBaXZDdwmM',
    appId: '1:170205363897:android:ceb167663da186be5b2568',
    messagingSenderId: '170205363897',
    projectId: 'bitirme-4d4cb',
    storageBucket: 'bitirme-4d4cb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4PKXwlWFsZmWKGvaXMW-6amkDhwZ-V94',
    appId: '1:170205363897:ios:64153504e97a9ee05b2568',
    messagingSenderId: '170205363897',
    projectId: 'bitirme-4d4cb',
    storageBucket: 'bitirme-4d4cb.firebasestorage.app',
    iosBundleId: 'com.example.bitirmeprojesi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4PKXwlWFsZmWKGvaXMW-6amkDhwZ-V94',
    appId: '1:170205363897:ios:64153504e97a9ee05b2568',
    messagingSenderId: '170205363897',
    projectId: 'bitirme-4d4cb',
    storageBucket: 'bitirme-4d4cb.firebasestorage.app',
    iosBundleId: 'com.example.bitirmeprojesi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-klAh14wAKiDsDkYqYUdtcMLKoCe3MUI',
    appId: '1:170205363897:web:ee9e64193090d8a45b2568',
    messagingSenderId: '170205363897',
    projectId: 'bitirme-4d4cb',
    authDomain: 'bitirme-4d4cb.firebaseapp.com',
    storageBucket: 'bitirme-4d4cb.firebasestorage.app',
    measurementId: 'G-S1MDMS7LNV',
  );
}