import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import './add_post_screen.dart';
import '../widgets/post_item.dart';
import 'add_post_screen.dart';

class NewsfeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('add post'),
        actions:<Widget> [
          TextButton(
            style:style,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>NewsfeedScreen(),
                ),
              );
            },
            child: const Text('add post'),
          ),
          /*IconButton(
            icon: Icon(Icons.add,color:Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPostScreen(),
                ),
              );
            },
          ),*/
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