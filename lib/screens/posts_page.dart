import 'package:flutter/material.dart';
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

  void getPosts() async {
    posts = await Api_Handler.getPosts();
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
      body: Padding(
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
            )),
          ],
        ),
      ),
    );
  }
}
