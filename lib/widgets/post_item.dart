import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.username, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(post.content),
            SizedBox(height: 5),
            Text(post.timestamp.toString(), style: TextStyle(color: Colors.grey)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        post.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: post.isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        Provider.of<PostProvider>(context, listen: false).toggleLike(post.id);
                      },
                    ),
                    Text(post.likeCount.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}