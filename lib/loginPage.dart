import 'dart:math';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'NewUser.dart';
import 'package:flutter/material.dart';
import 'blank.dart';
import 'forgotPass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  // signinWithGoogle() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
//
  //   try {
  //     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //   } catch (e) {}
  //   setState(() {
  //     _isLoading = true;
  //   });
  // }
//
  loginUsers() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthController()
        .loginUsers(_emailController.text, _passwordController.text);

    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar('Logged in', context);
    }
    final d = res;
  }
  //if (res != 'success') {
  //  setState(() {
  //    _isLoading = false;
  //  });
  //  return showSnackBar(res, context);
  //} else {
  //  Navigator.push(
  //    context,
  //    MaterialPageRoute(builder: (context) => BlankPage()),
  //  );
  //}
  //if (res != 'success') {
  //  setState(() {
  //    _isLoading = false;
  //  });
  //  if (!mounted) return;
  //  return showSnackBar(res, context);
  //} else {
  //  if (!mounted) return;
  //  showSnackBar(
  //      'Congratulations you have been successfully signed in..', context);
  //  return Navigator.pushReplacement(
  //      context,
  //      MaterialPageRoute<void>(
  //        builder: (BuildContext context) => const BlankPage(),
  //      ));
  //  ;
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Hello
            SizedBox(
              height: 5,
            ),
            Text(
              'Hello Again!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'WELCOME to MyAPP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),

            //email Textfield

            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            //password Textfield
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),

            //forgot password?
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("Forgot Password?"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPass()),
                      );
                    },
                  ),
                ],
              ),
            ),
//            //sign in button
            ElevatedButton(
              onPressed: () async {
                loginUsers();
                var d = await AuthController().loginUsers(
                    _emailController.text, _passwordController.text);

                if (d == 'Success') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankPage()),
                  );
                }
              },
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text("Sign in"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            //not a member? register now
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                TextButton(
                  child: Text("Register Now!"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUser()),
                    );
                  },
                ),
              ],
            ),
            //Google
            // SizedBox(
            // height: 5,
            //),
            //  ElevatedButton(
            //    onPressed: () async {
            //      signinWithGoogle().then((_) {
            //        Navigator.pushReplacement(
            //            context,
            //            MaterialPageRoute<void>(
            //              builder: (BuildContext context) => const BlankPage(),
            //            ));
            //      });
            //    },
            //    child: _isLoading
            //        ? Center(
            //            child: CircularProgressIndicator(color: Colors.white),
            //          )
            //        : Text("Sign in with Google"),
            //    style: ElevatedButton.styleFrom(
            //      foregroundColor: Colors.white,
            //      backgroundColor: Colors.blue,
            //    ),
            //  ),
          ]),
        ),
      ),
    );
  }
}
