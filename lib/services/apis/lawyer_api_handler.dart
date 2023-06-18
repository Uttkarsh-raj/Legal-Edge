import 'dart:convert';
import 'dart:developer';

import 'package:hackman/services/models/lawyer_model.dart';
import 'package:http/http.dart' as http;

class LawyerApiHandler {
  static Future<List<dynamic>> getLawyerData() async {
    try {
      var uri = Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/lawyers');
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      print(data);
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
}
