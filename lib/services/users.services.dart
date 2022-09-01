import 'dart:convert';
import 'dart:io';

import 'package:ilkuygulamam/globals.variables.dart';
import 'package:ilkuygulamam/models/post.model.dart';
import 'package:ilkuygulamam/models/user.model.dart';

class UsersServices {
  Future<UserModel> GetPost(int number) async {
    var serviceUrl = Uri.parse('$baseServiceUrl/users/$number');
    var request = await HttpClient().getUrl(serviceUrl);
    var response = await request.close();
    if (response.statusCode == 200) {
      String stringData = await response.transform(const Utf8Decoder()).join();
      var jsonobject = jsonDecode(stringData);
      return UserModel.fromJson(jsonobject);
    } else {
      return UserModel();
    }
  }
}
