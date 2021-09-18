import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quoted_app/model/quote.dart';

abstract class QuotesController {
  static Stream getAllQuotes() {
    return FirebaseFirestore.instance.collection('quotes').snapshots();
  }

  static Future<bool> addQuote(Quote quote) async {
    print(quote.toMap());
    CollectionReference quotes =
        FirebaseFirestore.instance.collection('quotes');
    bool toReturnValue = true;
    await quotes.add(quote.toMap()).then((value) {
      toReturnValue = true;
    }).onError((error, stackTrace) {
      toReturnValue = false;
      print(error);
    });
    return toReturnValue;
  }
}
