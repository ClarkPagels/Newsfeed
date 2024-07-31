import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import './add_post_screen.dart';
import '../widgets/post_item.dart';
import 'add_post_screen.dart';
class NewsfeedScreen extends StatefulWidget {
  @override
  _NewsfeedScreenState createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  final _nameController = TextEditingController();

  String _userName = '';

  void _updateUserName() {
    setState(() {
      _userName = _nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Enter your name'),
                    controller: _nameController,
                    onSubmitted: (_) => _updateUserName(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: _updateUserName,
                ),
              ],
            ),
          ),
          if (_userName.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hello, $_userName!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
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