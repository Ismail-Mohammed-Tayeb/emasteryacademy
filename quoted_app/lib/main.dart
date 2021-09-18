import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/home_page.dart';
import 'view/login_page.dart';

main() {
  runApp(
    MaterialApp(
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Wrapper extends StatelessWidget {
  const Wrapper() : super();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        FirebaseAuth auth = FirebaseAuth.instance;
        if (auth.currentUser == null) {
          return LoginPage();
        }
        return HomePage();
      },
    );
  }
}
