import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quoted_app/controller/quotes_controller.dart';
import 'package:quoted_app/model/quote.dart';

class AddQuotePage extends StatefulWidget {
  AddQuotePage() : super();

  @override
  _AddQuotePageState createState() => _AddQuotePageState();
}

class _AddQuotePageState extends State<AddQuotePage> {
  bool isLoading = false;
  String quoteText = '', quoteAuthor = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Add Quote'),
          elevation: 0.0,
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[900],
        body: SizedBox.expand(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
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
                            maxLines: 7,
                            maxLength: 200,
                            decoration: InputDecoration(
                              hintText: 'Quote Text',
                            ),
                            onChanged: (txt) {
                              if (txt.trim().length == 0) {
                                quoteText = '';
                                return;
                              }
                              quoteText = txt.trim();
                            },
                          ),
                          TextField(
                            maxLength: 40,
                            decoration: InputDecoration(
                              hintText: 'Quote Author',
                            ),
                            onChanged: (txt) {
                              if (txt.trim().length == 0) {
                                quoteAuthor = '';
                                return;
                              }
                              quoteAuthor = txt.trim();
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
                                    onPressed: _addQuote,
                                    child: Text('Add Quote'),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addQuote() async {
    if (quoteText.isEmpty || quoteAuthor.isEmpty) {
      await Fluttertoast.showToast(
          msg: "Please Fill All Fields \nBefore Pressing Add Quote",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.green,
          fontSize: 20.0);
      return;
    }
    setState(() {
      isLoading = true;
    });
    bool res = await QuotesController.addQuote(
      Quote(
        text: quoteText,
        author: quoteAuthor,
        publisherId: FirebaseAuth.instance.currentUser!.uid,
      ),
    );
    setState(() {
      isLoading = false;
    });
    if (res) {
      await Fluttertoast.showToast(
        msg: "Your Quote Has Been Added Succesfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.green,
        fontSize: 20.0,
      );
      return;
    }

    await Fluttertoast.showToast(
      msg: "An Error Occured, Your Quote Hasn't Been Added",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.green,
      fontSize: 20.0,
    );
  }
}
