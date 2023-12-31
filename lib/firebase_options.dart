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
    apiKey: 'AIzaSyBQYJSV-gN5sAYw5ybV1UreWHhT4xDYM0M',
    appId: '1:870295326689:web:f71006cb03d2edf9fd0ca0',
    messagingSenderId: '870295326689',
    projectId: 'fir-2b39e',
    authDomain: 'fir-2b39e.firebaseapp.com',
    storageBucket: 'fir-2b39e.appspot.com',
    measurementId: 'G-L9PCPW7F8G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH0dSb9knv-sC3bSX4sRl1fnEErXh9yik',
    appId: '1:870295326689:android:20da247893f64ac2fd0ca0',
    messagingSenderId: '870295326689',
    projectId: 'fir-2b39e',
    storageBucket: 'fir-2b39e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASB6f4JOU0zTjjvz4RR-GswYLa3lUnC64',
    appId: '1:870295326689:ios:bc2fe6b6627fa6abfd0ca0',
    messagingSenderId: '870295326689',
    projectId: 'fir-2b39e',
    storageBucket: 'fir-2b39e.appspot.com',
    androidClientId: '870295326689-ji21ein7clcg5v9rvjfdqi75glffre2s.apps.googleusercontent.com',
    iosClientId: '870295326689-t4mkt70pvd4to17gipitkf1cf7bpip10.apps.googleusercontent.com',
    iosBundleId: 'com.example.phoneNumOtpAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASB6f4JOU0zTjjvz4RR-GswYLa3lUnC64',
    appId: '1:870295326689:ios:e20bf687c88a9abefd0ca0',
    messagingSenderId: '870295326689',
    projectId: 'fir-2b39e',
    storageBucket: 'fir-2b39e.appspot.com',
    androidClientId: '870295326689-ji21ein7clcg5v9rvjfdqi75glffre2s.apps.googleusercontent.com',
    iosClientId: '870295326689-co409m05h4li1ibst48beqs2529rk2ns.apps.googleusercontent.com',
    iosBundleId: 'com.example.phoneNumOtpAuth.RunnerTests',
  );
}
