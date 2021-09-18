import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisitPage extends StatelessWidget {
  final String? url;
  const VisitPage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          "Visit Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
