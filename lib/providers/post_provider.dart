import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import 'dart:convert';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(String username, String content) {
    final newPost = Post(
      id: DateTime.now().toString(),
      username: username,
      content: content,
      timestamp: DateTime.now(),
    );
    _posts.insert(0, newPost);
    savePostsToLocalStorage();
    notifyListeners();
  }

  void toggleLike(String postId) {
    final postIndex = _posts.indexWhere((post) => post.id == postId);
    if (postIndex >= 0) {
      _posts[postIndex].isLiked = !_posts[postIndex].isLiked;
      _posts[postIndex].isLiked ? _posts[postIndex].likeCount++ : _posts[postIndex].likeCount--;
      savePostsToLocalStorage();
      notifyListeners();
    }
  }

  void savePostsToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _posts.map((post) => {
      'id': post.id,
      'username': post.username,
      'content': post.content,
      'timestamp': post.timestamp.toIso8601String(),
      'likeCount': post.likeCount,
      'isLiked': post.isLiked,
    }).toList();
    prefs.setString('posts', json.encode(data));
  }

  Future<void> loadPostsFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString('posts');
    if (dataString != null) {
      final data = json.decode(dataString) as List;
      _posts = data.map((item) => Post(
        id: item['id'],
        username: item['username'],
        content: item['content'],
        timestamp: DateTime.parse(item['timestamp']),
        likeCount: item['likeCount'],
        isLiked: item['isLiked'],
      )).toList();
      notifyListeners();
    }
  }
}