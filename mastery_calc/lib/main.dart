import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.grey[800],
    primaryColor: Colors.white,
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.white,
    primaryColor: Colors.grey[900],
  );
  runApp(
    AdaptiveTheme(
      dark: darkTheme,
      light: lightTheme,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return MaterialApp(
          title: 'MasteryCalc',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          home: CalcHomePage(),
        );
      },
    ),
  );
}

class CalcHomePage extends StatefulWidget {
  const CalcHomePage({Key? key}) : super(key: key);

  @override
  _CalcHomePageState createState() => _CalcHomePageState();
}

class _CalcHomePageState extends State<CalcHomePage> {
  // val1 operation val2 =
  String? val1;
  String result = '0';
  String currentOperation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            getResult(),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 70.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          val1 = null;
                          result = '0';
                        }, 'AC', Colors.grey[300]),
                        buildCalcButtonFromRawMaterialButton(
                            () {}, '+/-', Colors.grey[300]),
                        buildCalcButtonFromRawMaterialButton(
                            () {}, '%', Colors.grey[300]),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          result = val1!;
                          currentOperation = '/';
                          result = val1!;
                        }, '/', Color(0xFFFB9C13)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '7';
                          } else {
                            val1 = val1! + '7';
                          }
                        }, '7', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '8';
                          } else {
                            val1 = val1! + '8';
                          }
                        }, '8', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '9';
                          } else {
                            val1 = val1! + '9';
                          }
                        }, '9', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          result = val1!;
                          currentOperation = 'X';
                        }, 'X', Color(0xFFFB9C13)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '4';
                          } else {
                            val1 = val1! + '4';
                          }
                        }, '4', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '5';
                          } else {
                            val1 = val1! + '5';
                          }
                        }, '5', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '6';
                          } else {
                            val1 = val1! + '6';
                          }
                        }, '6', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          result = val1!;
                          currentOperation = '-';
                          val1 = null;
                        }, '-', Color(0xFFFB9C13)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '1';
                          } else {
                            val1 = val1! + '1';
                          }
                        }, '1', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '2';
                          } else {
                            val1 = val1! + '2';
                          }
                        }, '2', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) {
                            val1 = '3';
                          } else {
                            val1 = val1! + '3';
                          }
                        }, '3', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          result = val1!;
                          currentOperation = '+';
                          val1 = null;
                        }, '+', Color(0xFFFB9C13)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                fixedSize: MaterialStateProperty.all(
                                  Size(50, 70),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () {
                                if (val1 != null) val1 = val1! + '0';
                                if (val1 == null) {
                                  val1 = '0';
                                } else {
                                  val1 = val1! + '0';
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        buildCalcButtonFromRawMaterialButton(
                            () {}, ',', Colors.white),
                        buildCalcButtonFromRawMaterialButton(() {
                          setState(() {});
                          if (val1 == null) return;
                          if (currentOperation == '+') {
                            val1 = (double.parse(result) + double.parse(val1!))
                                .toString();
                          } else if (currentOperation == '-') {
                            val1 = (double.parse(result) - double.parse(val1!))
                                .toString();
                          }
                          getResult();
                        }, '=', Color(0xFFFB9C13)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCalcButtonFromRawMaterialButton(
    Function() function,
    String txtValue,
    Color? buttonColor,
  ) {
    return Expanded(
      child: Container(
        width: 70,
        height: 70,
        child: RawMaterialButton(
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
          onPressed: function,
          elevation: 5.0,
          fillColor: buttonColor,
          child: Text(
            txtValue,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  String getResult() {
    setState(() {});

    if (val1 != null) {
      return val1!;
    }
    if (val1 != null && result.isNotEmpty) {
      return result;
    }
    return '0';
  }
}
