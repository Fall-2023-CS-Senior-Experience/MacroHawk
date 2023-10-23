import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBHJi-ZqmfzvqxKDA3yebj-5W-dXVVLF2A",
            authDomain: "macrohawk-62e43.firebaseapp.com",
            projectId: "macrohawk-62e43",
            storageBucket: "macrohawk-62e43.appspot.com",
            messagingSenderId: "613594351059",
            appId: "1:613594351059:web:d839784216c043947edb26",
            measurementId: "G-KD5HHJ8FQ7"));
  } else {
    await Firebase.initializeApp();
  }
}
