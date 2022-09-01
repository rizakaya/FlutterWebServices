import 'dart:convert';
import 'dart:io';

import 'package:ilkuygulamam/globals.variables.dart';
import 'package:ilkuygulamam/models/post.model.dart';

class PostServices {
  Future<PostModel> GetPost(int number) async {
    var serviceUrl = Uri.parse('$baseServiceUrl/posts/$number');
    var request = await HttpClient().getUrl(serviceUrl);
    var response = await request.close();
    if (response.statusCode == 200) {
      String stringData = await response.transform(const Utf8Decoder()).join();
      var jsonobject = jsonDecode(stringData);
      return PostModel.fromMap(jsonobject);
    } else {
      return PostModel.empty();
    }
  }
}
