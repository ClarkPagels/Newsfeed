import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import './add_post_screen.dart';
import '../widgets/post_item.dart';
import 'add_post_screen.dart';

class NewsfeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PostProvider>(
              builder: (ctx, postProvider, _) => ListView.builder(
                itemCount: postProvider.posts.length,
                itemBuilder: (ctx, index) => PostItem(postProvider.posts[index]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AddPostScreen(),
                  ),
                );
              },
              child: Text('Add Post'),
            ),
          ),
        ],
      ),
    );
  }
}