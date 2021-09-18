import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwiki_learn/fav.dart';
import 'package:qwiki_learn/list_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  RxString _currentUrl = ''.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Obx(
          () {
            Color? backgroundColor;
            Color? foregorundColor;
            if (ListController.doesExist(_currentUrl.value)) {
              backgroundColor = Colors.black;
              foregorundColor = Colors.red;
            } else {
              backgroundColor = Colors.red;
              foregorundColor = Colors.black;
            }
            return FloatingActionButton(
              onPressed: () {
                bool res = ListController.addToList(_currentUrl.value);
                print(res);
              },
              backgroundColor: backgroundColor,
              child: Icon(
                Icons.favorite,
                color: foregorundColor,
              ),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: Text(
            "Qwiki Learn",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (e) => FavPage()));
              },
              icon: Icon(
                Icons.star,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SizedBox.expand(
          child: WebView(
            onWebViewCreated: (WebViewController webViewController) async {
              _controller.complete(webViewController);
              _currentUrl.value = await webViewController.currentUrl() ?? "";
            },
            initialUrl: 'https://en.wikipedia.org/wiki/Main_Page',
            onPageFinished: (onPageFinished) {
              _currentUrl.value = onPageFinished;
            },
          ),
        ),
      ),
    );
  }
}
