import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_constants.dart';

import '../screens/post_page.dart';
import '../services/apis/post_api_handler.dart';
import '../services/models/post_model.dart';

class RedditPostWidget extends StatelessWidget {
  final Post post;
  final String id;
  final String title;
  final String email;
  final String author;
  final String description;
  final String time;
  final String? profilePhoto;
  final List<String?> likedBy;

  RedditPostWidget({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.time,
    required this.post,
    required this.profilePhoto,
    required this.id,
    required this.likedBy,
    required this.email,
  });
  void like(String email, String postId) async {
    print("tap");
    print("$email");
    print("$postId");
    await PostApiHandler.likePost(email, postId);
  }

  bool isThere(String email) {
    if (likedBy.contains(email)) {
      return true;
    }
    return false;
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        IndividualPostPage(post: post, id: id),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: (profilePhoto != null)
                            ? NetworkImage('$profilePhoto')
                            : NetworkImage(AppConstantsProfile.defaultAvatar),
                        radius: 22,
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => like(user.email!, post.id!),
                        child: (isThere(user.email!))
                            ? Image.asset(
                                'asset/images/icons8-law-90.png',
                                scale: 4,
                              )
                            : Image.asset(
                                'asset/images/icons8-law-96.png',
                                scale: 4,
                              ),
                      ),
                      const SizedBox(width: 8.0),
                      Text("${post.likes}"),
                    ],
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
