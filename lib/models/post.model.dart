import 'package:flutter/cupertino.dart';

class PostModel {
  int id = 0;
  String title = "";
  PostModel.empty()
      : id = 0,
        title = "";
  PostModel.fromMap(Map json)
      : id = json["id"],
        title = json["title"];
}
