import 'package:flutter/cupertino.dart';

abstract class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
  }

  static double getProportianteScreenWidth(double inputWidth) {
    double res = (inputWidth / 400.0) * SizeConfig.screenWidth!;
    print(res);
    return (inputWidth / 400.0) * SizeConfig.screenWidth!;
  }

  static double getProportianteScreenHeight(double inputHeight) {
    double res = (inputHeight / 810.0) * SizeConfig.screenHeight!;
    print(res);
    return (inputHeight / 810.0) * SizeConfig.screenHeight!;
  }
}
