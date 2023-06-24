import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackman/screens/profile_page.dart';
import 'package:hackman/services/apis/post_api_handler.dart';
import 'package:hackman/services/models/user_model.dart';
import 'package:hackman/utils/posts_card.dart';

import '../app_consts/app_colors.dart';
import '../services/apis/user_api_handler.dart';
import '../services/models/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  List<String> likedBy = [];
  bool present = false;
  String? profilPic = FirebaseAuth.instance.currentUser?.photoURL;
  final User user = FirebaseAuth.instance.currentUser!;

  void getPosts() async {
    posts = await PostApiHandler.getPosts();
    print('new post: ${posts}');
    setState(() {
      if (posts.isNotEmpty) present = true;
    });
  }

  UserModle? userData;
  void getUser(String email) async {
    userData = await UserApiHandler.getUserByEmail(email);
    setState(() {});
  }

  void logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    setState(() {});
  }

  @override
  void initState() {
    getPosts();
    print(user.email);
    getUser(user.email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.072,
        backgroundColor: AppColorsConstants.primaryBackgroundColor,
        elevation: 5,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(
                userData: userData!,
              ),
            ));
          },
          child: CircleAvatar(
            child: CircleAvatar(
              backgroundImage: NetworkImage(profilPic ??
                  'https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png'),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: logout,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app_outlined),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'LegalEdge',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: (present)
          ? RefreshIndicator(
              onRefresh: () async {
                getPosts();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return RedditPostWidget(
                            email: posts[index].email ?? "",
                            id: posts[index].id!,
                            profilePhoto: posts[index].profileP,
                            post: posts[index],
                            title: posts[index].title ?? "",
                            author: posts[index].name ?? "",
                            description: posts[index].description ?? "",
                            time: posts[index].time ?? "",
                            likedBy: posts[index].likedBy!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                getPosts();
              },
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
