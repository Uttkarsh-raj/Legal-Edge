import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hackman/screens/new_post.dart';
import 'package:hackman/services/apis/api_handler.dart';
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

  void getPosts() async {
    posts = await Api_Handler.getPosts();
    setState(() {
      present = true;
    });
    print(posts);
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: const CircleAvatar(
          backgroundImage: AssetImage('asset/images/avatar3.png'),
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
          ? Padding(
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
