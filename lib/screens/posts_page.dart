import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackman/screens/new_post.dart';
import 'package:hackman/services/apis/post_api_handler.dart';
import 'package:hackman/utils/posts_card.dart';

import '../services/models/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  bool present = false;
  String? profilPic = FirebaseAuth.instance.currentUser?.photoURL;

  void getPosts() async {
    posts = await PostApiHandler.getPosts();
    setState(() {
      present = true;
    });
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: logOut,
              child: const Icon(
                IconlyBold.logout,
              ),
            ),
          ),
        ],
        elevation: 5,
        leading: CircleAvatar(
          child: CircleAvatar(
            backgroundImage: NetworkImage(profilPic ??
                'https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png'),
          ),
        ),
        centerTitle: true,
        title: const Text('Posts: '),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          Icon(Icons.home),
          Icon(Icons.message_outlined),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NewPostPage(),
          ),
        ),
        child: const Icon(
          IconlyBold.plus,
          size: 40,
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
                            title: posts[index].title!,
                            author: posts[index].name!,
                            description: posts[index].description!,
                            time: posts[index].time!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
