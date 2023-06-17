import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

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

  static Future registerUser(
      String name, String email, int number, String profilePicUrl) async {
    var response = await http.post(
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
          "role": "User"
        },
      ),
    );
    print(
        "*******************************************************************************\nResponse Status: ${response.statusCode}********************************************************************************\n");
  }
}
