import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBfxjtClxmaRgYwhG-b9Wtd5sl_sk7B7io",
            authDomain: "silah-4ba37.firebaseapp.com",
            projectId: "silah-4ba37",
            storageBucket: "silah-4ba37.appspot.com",
            messagingSenderId: "314969008159",
            appId: "1:314969008159:web:ee2275584abca655944d2a",
            measurementId: "G-WFV81443X2"));
  } else {
    await Firebase.initializeApp();
  }
}
