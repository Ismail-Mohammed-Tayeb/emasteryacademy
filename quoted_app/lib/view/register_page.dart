import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage() : super();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '', password = '', confirmPassword = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: SizedBox.expand(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 450,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                            onChanged: (txt) {
                              if (txt.trim().length == 0) {
                                email = '';
                                return;
                              }
                              email = txt.trim();
                            },
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            onChanged: (txt) {
                              if (txt.trim().length < 6) {
                                password = '';
                                return;
                              }
                              password = txt.trim();
                            },
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                            ),
                            onChanged: (txt) {
                              if (txt.trim().length < 6) {
                                confirmPassword = '';
                                return;
                              }
                              confirmPassword = txt.trim();
                            },
                          ),
                          isLoading
                              ? CircularProgressIndicator()
                              : SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue[900])),
                                    onPressed: _loginUser,
                                    child: Text('Register'),
                                  ),
                                ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    if (email.isEmpty) {
      await Fluttertoast.showToast(
          msg: "Email Not Filled",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.green,
          fontSize: 20.0);
      return;
    }
    if (password.isEmpty) {
      await Fluttertoast.showToast(
          msg: "Password Not Filled",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.green,
          fontSize: 20.0);
      return;
    }
    if (password.compareTo(confirmPassword) != 0) {
      await Fluttertoast.showToast(
          msg: "Password Mismatch",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.green,
          fontSize: 20.0);
      return;
    }
    setState(() {
      isLoading = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      log('Called Then User Credentials Are: \n');
      print(value);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => HomePage(),
        ),
      );
    }).onError((error, stackTrace) {
      log('Called On Error, Error Is: \n');
      print(error);
    });
    setState(() {
      isLoading = false;
    });
  }
}
