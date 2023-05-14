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
    apiKey: 'AIzaSyAHwyD62BOUAiMfmHWzPK5DEUHESB2agcQ',
    appId: '1:216179238716:web:8170aaeba6a64ff6496039',
    messagingSenderId: '216179238716',
    projectId: 'cacatalentosmobile',
    authDomain: 'cacatalentosmobile.firebaseapp.com',
    storageBucket: 'cacatalentosmobile.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFLVWKQEaMheY7xzn018X8ESMVNf0AsqQ',
    appId: '1:216179238716:android:e25eaec9d4c94c3d496039',
    messagingSenderId: '216179238716',
    projectId: 'cacatalentosmobile',
    storageBucket: 'cacatalentosmobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkfDEAwg22QOjOccQGyq5cfEeqS5MW4W8',
    appId: '1:216179238716:ios:8429082f101be978496039',
    messagingSenderId: '216179238716',
    projectId: 'cacatalentosmobile',
    storageBucket: 'cacatalentosmobile.appspot.com',
    iosClientId: '216179238716-dfb0jhu94afo32h2o752uqs4mbp6pt4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.cacaTalentos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkfDEAwg22QOjOccQGyq5cfEeqS5MW4W8',
    appId: '1:216179238716:ios:e4ce43545f73b312496039',
    messagingSenderId: '216179238716',
    projectId: 'cacatalentosmobile',
    storageBucket: 'cacatalentosmobile.appspot.com',
    iosClientId: '216179238716-j2d461ouqkao0e2jit5m6d1pn60oe158.apps.googleusercontent.com',
    iosBundleId: 'com.example.cacaTalentos.RunnerTests',
  );
}