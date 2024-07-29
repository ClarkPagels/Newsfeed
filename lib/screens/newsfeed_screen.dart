import 'package:flutter/material.dart';
import '../providers/post_provider.dart';
import './add_post_screen.dart';
import '../widgets/post_item.dart';

class NewsfeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPostScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (ctx, postProvider, _) => ListView.builder(
          itemCount: postProvider.posts.length,
          itemBuilder: (ctx, index) => PostItem(postProvider.posts[index]),
        ),
      ),
    );
  }
}