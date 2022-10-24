import 'dart:ui';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'NewUser.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
