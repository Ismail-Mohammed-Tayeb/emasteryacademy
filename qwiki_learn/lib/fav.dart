import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwiki_learn/list_data.dart';
import 'package:qwiki_learn/visit_page.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            "Fav Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox.expand(
          child: Obx(() {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: ListController.favList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) =>
                              VisitPage(url: ListController.favList[index]),
                        ),
                      );
                    },
                    title: Text(
                      ListController.favList[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        ListController.removeFromList(
                            ListController.favList[index]);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
