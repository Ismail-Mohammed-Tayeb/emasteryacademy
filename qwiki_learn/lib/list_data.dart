import 'package:get/get.dart';

abstract class ListController {
  static RxList<String> favList = RxList<String>();

  static bool addToList(String url) {
    if (favList.contains(url)) return false;
    favList.add(url);
    return true;
  }

  static removeFromList(String url) {
    favList.remove(url);
  }

  static bool doesExist(String url) {
    return favList.contains(url);
  }
}
