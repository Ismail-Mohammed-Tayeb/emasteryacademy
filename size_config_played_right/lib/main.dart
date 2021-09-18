import 'package:flutter/material.dart';
import 'package:size_config_played_right/size_config.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: SizeConfig.screenHeight! * .3,
              width: SizeConfig.screenWidth! * .3,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
