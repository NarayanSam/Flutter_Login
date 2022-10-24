import 'dart:ui';
import 'package:flutter_application_1/controllers/auth_controller.dart';

import 'blank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginPage.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Create New Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            //Name
            SizedBox(
              height: 20,
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
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
            ),
            //E-mail
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
                      hintText: 'Enter New Password',
                    ),
                  ),
                ),
              ),
            ),
            //Confirm
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
                    controller: _confirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
              ),
            ),
            //create
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: InkWell(
                  onTap: () async {
                    await AuthController().signUpUser(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                        _confirmController.text);
                  },
                  child: Text("     Register     ")),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlankPage()),
                );
              },
            ),
            //already a user
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("Already a user!"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
