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
    apiKey: 'AIzaSyBbfdw7ALpqSa5XUkm0L3dqx0bxCqBIdSA',
    appId: '1:1024085322797:web:59f36c3953f7e61a689ca4',
    messagingSenderId: '1024085322797',
    projectId: 'quran-fe208',
    authDomain: 'quran-fe208.firebaseapp.com',
    storageBucket: 'quran-fe208.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5P8LZFBfoOSTmhHhGe1C8_jiKA364f6Y',
    appId: '1:1024085322797:android:559e1511637c602a689ca4',
    messagingSenderId: '1024085322797',
    projectId: 'quran-fe208',
    storageBucket: 'quran-fe208.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOknSg_cFv8Q9KPy9xRbVyVlCZC2odWlU',
    appId: '1:1024085322797:ios:52347cfd19b5b247689ca4',
    messagingSenderId: '1024085322797',
    projectId: 'quran-fe208',
    storageBucket: 'quran-fe208.appspot.com',
    iosClientId: '1024085322797-ksgt8bsju9qb8idpfs6r04u0go6rm4lr.apps.googleusercontent.com',
    iosBundleId: 'com.example.quranapplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOknSg_cFv8Q9KPy9xRbVyVlCZC2odWlU',
    appId: '1:1024085322797:ios:52347cfd19b5b247689ca4',
    messagingSenderId: '1024085322797',
    projectId: 'quran-fe208',
    storageBucket: 'quran-fe208.appspot.com',
    iosClientId: '1024085322797-ksgt8bsju9qb8idpfs6r04u0go6rm4lr.apps.googleusercontent.com',
    iosBundleId: 'com.example.quranapplication',
  );
}
