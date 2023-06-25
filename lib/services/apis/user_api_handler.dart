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

  static Future<UserModle> getUserById(String id) async {
    var userData = getUser(id);
    return UserModle.userfromSnapshot(userData);
  }

  static Future<UserModle> getAllUsers() async {
    var userData = getUserData();
    return UserModle.userfromSnapshot(userData);
  }

  static Future<UserModle> getUserByEmail(String email) async {
    try {
      var uri = Uri.parse(
          'https://hkmn-dev-new.onrender.com/api/v1/user/find/$email');
      print(uri);
      var res = await http.get(uri);
      print('res: $res');
      var data = jsonDecode(res.body);
      if (res.statusCode != 200) {
        throw data["message"];
      }
      UserModle user = UserModle.fromjson(data["user"]);
      return user;
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
    // try {
    //   var uri = Uri.parse('http://192.168.149.50:5000/api/v1/user/find/$email');
    //   // var uri = Uri.parse(
    //   //     'https://hkmn-dev-new.onrender.com/api/v1/user/find/$email');
    //   var res = await http.get(uri);
    //   var data = jsonDecode(res.body);
    //   if (res.statusCode != 200) {
    //     throw data['message'];
    //   }
    //   print('data: $data');
    //   print(User.fromjson(data));
    //   return User.fromjson(data);
    // } catch (e) {
    //   log("An error occured $e.");
    //   throw e.toString();
    // }
  }

  static Future registerUser(
      String name, String email, String number, String profilePicUrl) async {
    print('register');
    await http.post(
      Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/user/register'),
      // Uri.parse('http://172.25.6.77:5000/api/V1/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "url": profilePicUrl,
          "name": name,
          "email": email,
          "contact": number,
          "role": "User",
        },
      ),
    );
  }
}
