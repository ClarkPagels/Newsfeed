import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
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
