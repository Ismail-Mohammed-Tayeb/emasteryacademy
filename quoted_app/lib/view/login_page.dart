import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';
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
                      'Quoted Mastery',
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
                                    child: Text('Login'),
                                  ),
                                ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              'Register',
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
        fontSize: 20.0,
      );
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
    setState(() {
      isLoading = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      log('Called Then User Credentials Are: \n');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => HomePage(),
        ),
      );
      print(value);
    }).onError((error, stackTrace) {
      log('Called On Error, Error Is: \n');
      print(error);
    });
    setState(() {
      isLoading = false;
    });
  }
}
