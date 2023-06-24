import 'dart:convert';
import 'dart:developer';

import 'package:hackman/services/models/lawyer_model.dart';
import 'package:http/http.dart' as http;

class LawyerApiHandler {
  static Future<List<dynamic>> getLawyerData() async {
    try {
      var uri = Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/lawyers');
      // var uri = Uri.parse('http://172.25.6.77:5000/api/v1/lawyers');
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      List temp = [];
      if (res.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data['lawyers']) {
        temp.add(v);
      }
      return temp;
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<List<dynamic>> getLawyer(String? id) async {
    try {
      var uri =
          Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/lawyers/$id');
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

  static Future<List<Lawyer>> getLawyers() async {
    List temp = await getLawyerData();
    print(temp);
    return Lawyer.lawyersFromSnapshot(temp);
  }

  static Future<List<Lawyer>> searchLawyers(String search) async {
    try {
      var uri = Uri.https(
          'hkmn-dev-new.onrender.com', '/api/v1/lawyers', {'name': search});
      // var uri = Uri.parse('http://172.25.6.77:5000/api/v1/lawyers');
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      List temp = [];
      if (res.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data['lawyers']) {
        temp.add(v);
      }
      return Lawyer.lawyersFromSnapshot(temp);
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future registerLawyer(
    String? profilePic,
    String? calendlyLink,
    String? name,
    String? email,
    String? address,
    String? city,
    String? regNo,
    List<String?>? cases,
    List<String?>? courts,
    String? contact,
    String? discription,
  ) async {
    await http.post(
      Uri.parse('https://hkmn-dev-new.onrender.com/api/V1/lawyer/register'),
      // Uri.parse('http://172.25.6.77:5000/api/V1/lawyer/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "url": profilePic,
          "name": name,
          "email": email,
          "city": city,
          "address": address,
          "regNo": regNo,
          "cases": cases,
          "courts": courts,
          "contact": contact,
          "desc": discription,
          "calendly": calendlyLink,
        },
      ),
    );
  }
}
