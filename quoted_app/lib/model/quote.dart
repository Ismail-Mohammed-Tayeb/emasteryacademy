import 'package:flutter/cupertino.dart';

class Quote {
  String? text, author, publisherId;
  Quote({
    @required this.text,
    @required this.author,
    @required this.publisherId,
  });

  Map<String, String?> toMap() {
    return {
      'text': this.text,
      'author': this.author,
      'publisherId': this.publisherId,
    };
  }

  static Quote fromMap(Map<String, String?> document) {
    return Quote(
      text: document['text'],
      author: document['author'],
      publisherId: document['publisherId'],
    );
  }
}
