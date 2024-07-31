import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import 'newsfeed_screen.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _usernameController = TextEditingController();
  final _contentController = TextEditingController();

  void _submitData() {
    if (_usernameController.text.isEmpty || _contentController.text.isEmpty) {
      return;
    }
    Provider.of<PostProvider>(context, listen: false).addPost(
      _usernameController.text,
      _contentController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Back to main'),
        actions:<Widget>[

        TextButton(
          style:style,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) =>NewsfeedScreen(),
              ),
            );
          },
          child: const Text('back to newsfeed'),
        ),
         /*
          IconButton(
            icon: Icon(Icons.,color:Colors.black),
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
              controller: _usernameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Content'),
              controller: _contentController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add Post'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),

    );
  }
}
