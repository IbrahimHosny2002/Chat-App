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
    apiKey: 'AIzaSyAGG0ClvbqZEjEkjEjyuHxsbCu71Zv4mBk',
    appId: '1:382275815867:web:2fba82c29fd359915f5c9e',
    messagingSenderId: '382275815867',
    projectId: 'chat-app-5f29a',
    authDomain: 'chat-app-5f29a.firebaseapp.com',
    storageBucket: 'chat-app-5f29a.appspot.com',
    measurementId: 'G-BP67G5466E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVJLKkYoyLW9dx7mTgf02gAOrol67gUL8',
    appId: '1:382275815867:android:ea155b6bad8058245f5c9e',
    messagingSenderId: '382275815867',
    projectId: 'chat-app-5f29a',
    storageBucket: 'chat-app-5f29a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiIAI2-msp0Ovk8jvNHGeUX_7Lk12sR8s',
    appId: '1:382275815867:ios:c4c3f91d52f2f6a15f5c9e',
    messagingSenderId: '382275815867',
    projectId: 'chat-app-5f29a',
    storageBucket: 'chat-app-5f29a.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiIAI2-msp0Ovk8jvNHGeUX_7Lk12sR8s',
    appId: '1:382275815867:ios:c277f484c42c38735f5c9e',
    messagingSenderId: '382275815867',
    projectId: 'chat-app-5f29a',
    storageBucket: 'chat-app-5f29a.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
