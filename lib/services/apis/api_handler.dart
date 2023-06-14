import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class Api_Handler {
  static Future<List<dynamic>> getData() async {
    try {
      var uri = Uri.parse("https://hkmn-api.onrender.com/posts");
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      List temp = [];
      if (res.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data) {
        temp.add(v);
      }
      return temp;
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<List<Post>> getPosts() async {
    List temp = await getData();
    return Post.postFromSnapshot(temp);
  }
}
