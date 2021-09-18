import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle allTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text(
                    '1\nColor: Red',
                    textAlign: TextAlign.center,
                    style: allTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue[800],
                      child: Center(
                        child: Text(
                          '0.5\nColor: Blue 800',
                          textAlign: TextAlign.center,
                          style: allTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          '0.5\nColor: Blue',
                          textAlign: TextAlign.center,
                          style: allTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.green[800],
                      child: Center(
                        child: Text(
                          '0.3\nColor: Green 800',
                          textAlign: TextAlign.center,
                          style: allTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.green[700],
                      child: Center(
                        child: Text(
                          '0.3\nColor: Green 700',
                          textAlign: TextAlign.center,
                          style: allTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          '0.3\nColor: Green',
                          textAlign: TextAlign.center,
                          style: allTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
