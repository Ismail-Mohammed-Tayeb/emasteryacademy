import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quoted_app/model/quote.dart';
import 'package:quoted_app/view/add_quote_page.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => AddQuotePage()));
          },
          backgroundColor: Colors.blue[600],
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Quotes'),
          elevation: .0,
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: 'Log Out',
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (c) => LoginPage(),
                  ),
                );
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: Colors.blue[900],
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('quotes').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot document = (snapshot.data!.docs[index]);
                  Quote currentQuote = Quote(
                      text: document['text'],
                      author: document['author'],
                      publisherId: document['publisherId']);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/quotes_icon.png',
                                    color: Colors.blue[900]!.withOpacity(.7),
                                  ),
                                ),
                                Text(
                                  '${(index + 1)}/${snapshot.data!.docs.length}',
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              currentQuote.text!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 30.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              currentQuote.author!,
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            currentQuote.publisherId ==
                                    FirebaseAuth.instance.currentUser!.uid
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          tooltip: 'Edit This Quote',
                                          onPressed: () async {
                                            CollectionReference reference =
                                                FirebaseFirestore.instance
                                                    .collection('quotes');
                                            await reference
                                                .doc(document.id)
                                                .update({
                                              'text': 'This is an edited Quote',
                                              'author': 'Test Author',
                                              'publisherId': FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue[900]!
                                                .withOpacity(.8),
                                          )),
                                      IconButton(
                                          tooltip: 'Delete This Quote',
                                          onPressed: () async {
                                            CollectionReference reference =
                                                FirebaseFirestore.instance
                                                    .collection('quotes');
                                            await reference
                                                .doc(document.id)
                                                .delete();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.blue[900]!
                                                .withOpacity(.8),
                                          )),
                                    ],
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            spreadRadius: .5,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
