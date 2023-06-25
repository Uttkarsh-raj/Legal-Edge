import 'dart:convert';
import 'dart:developer';

import 'package:hackman/services/models/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentApiHandler {
  static Future<List<dynamic>> getCommentData(String id) async {
    try {
      var uri = Uri.parse('https://hkmn-dev-new.onrender.com/api/v1/post/$id');
      var res = await http.get(uri);
      var data = jsonDecode(res.body);
      List temp = [];
      if (res.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data['post']['comment']) {
        temp.add(v);
        print(v);
      }
      return temp;
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<List<Comment>> getComments(String id) async {
    List temp = await getCommentData(id);
    print('temp: $temp');
    print(temp);
    return Comment.commentFromSnapshot(temp);
  }

  static Future postComment(
      String postId, String comment, String userEmail) async {
    await http.post(
      Uri.parse('https://hkmn-dev-new.onrender.com/api/V1/post/addComment'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'postId': postId,
          'commentDesc': comment,
          'userEmail': userEmail,
        },
      ),
    );
  }
}
