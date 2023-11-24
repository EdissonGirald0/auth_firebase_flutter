import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

// Ideal time to initialize
await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  // Disable persistence on web platforms. Must be called on initialization:
final auth = FirebaseAuth.instanceFor(app: Firebase.app(), persistence: Persistence.NONE);
// To change it after initialization, use `setPersistence()`:
await auth.setPersistence(Persistence.LOCAL);
}
