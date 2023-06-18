import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserApiHandler {
  static Future<List<dynamic>> getUserData() async {
    try {
      var uri = Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/users');
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

  static Future<dynamic> getUser(String? id) async {
    try {
      var uri = Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/user/$id');
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      if (res.statusCode != 200) {
        throw data['message'];
      }
      return data;
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<User> getUserById(String id) async {
    var userData = getUser(id);
    return User.userfromSnapshot(userData);
  }

  static Future registerUser(
      String name, String email, String number, String profilePicUrl) async {
    await http.post(
      Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "avatar": {
            "url": profilePicUrl,
          },
          "name": name,
          "email": email,
          "contact": number,
          "role": "User",
        },
      ),
    );
  }
}
