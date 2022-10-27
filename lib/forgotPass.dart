import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_controller.dart';

import 'dart:ui';
import 'loginPage.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass> {
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  ForgotPassword() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().ForgotPassword(_emailController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar('Email has been sent!', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              //E-mail
              SizedBox(
                height: 40,
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
              //Password

              //SizedBox(
              //  height: 10,
              //),
              //Padding(
              //  padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //  child: Container(
              //    decoration: BoxDecoration(
              //      color: Colors.grey[200],
              //      border: Border.all(color: Colors.white),
              //      borderRadius: BorderRadius.circular(12),
              //    ),
              //    child: Padding(
              //      padding: const EdgeInsets.only(left: 20),
              //      child: TextField(
              //        obscureText: true,
              //        decoration: InputDecoration(
              //          border: InputBorder.none,
              //          hintText: 'Enter New Password',
              //        ),
              //      ),
              //    ),
              //  ),
              //),
              ////Confirm
              //SizedBox(
              //  height: 10,
              //),
              //Padding(
              //  padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //  child: Container(
              //    decoration: BoxDecoration(
              //      color: Colors.grey[200],
              //      border: Border.all(color: Colors.white),
              //      borderRadius: BorderRadius.circular(12),
              //    ),
              //    child: Padding(
              //      padding: const EdgeInsets.only(left: 20),
              //      child: TextField(
              //        obscureText: true,
              //        decoration: InputDecoration(
              //          border: InputBorder.none,
              //          hintText: 'Confirm Password',
              //        ),
              //      ),
              //    ),
              //  ),
              //),
              //create
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: InkWell(
                    onTap: () {
                      ForgotPassword();
                      _emailController.clear();
                    },
                    child: _isLoading
                        ? Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : Text("Forgot Password")),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
            ]))));
  }
}
