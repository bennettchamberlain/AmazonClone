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
    apiKey: 'AIzaSyB8qLwowGsjuSKQnerPMEBs_VsGimkN-94',
    appId: '1:106480571860:web:8bacf51979086c33f47241',
    messagingSenderId: '106480571860',
    projectId: 'commerce-clone-85ee7',
    authDomain: 'commerce-clone-85ee7.firebaseapp.com',
    storageBucket: 'commerce-clone-85ee7.appspot.com',
    measurementId: 'G-9NEERVWJ1Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRJUZ3tGkcVVokb7pBvzz-Le80EV16QjU',
    appId: '1:106480571860:android:137b9d24c5656f97f47241',
    messagingSenderId: '106480571860',
    projectId: 'commerce-clone-85ee7',
    storageBucket: 'commerce-clone-85ee7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxvjAZAjDRmsrIW7hBBdaPY-4n1mjiOX0',
    appId: '1:106480571860:ios:db322575f3219b63f47241',
    messagingSenderId: '106480571860',
    projectId: 'commerce-clone-85ee7',
    storageBucket: 'commerce-clone-85ee7.appspot.com',
    iosClientId: '106480571860-dpqksn5cqi1od5pm86guv5g0m5pv0b4h.apps.googleusercontent.com',
    iosBundleId: 'bennettchamberlain.app.amazonClone',
  );
}
