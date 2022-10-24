import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  Future<String> signUpUser(
      String name, String email, String password, String confirm) async {
    String res = 'Some error occured';
    try {
      if (name.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          confirm.isNotEmpty) {
        UserCredential cred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.email);
        res = 'Success';
      } else {
        res = 'Fields must not be empty.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
