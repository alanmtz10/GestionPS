import 'package:GestionPS/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static Future<bool> registerUser(User user) async {
    try {
      AuthResult res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    try {
      AuthResult res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
