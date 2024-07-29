import 'package:flutter/material.dart';
import './providers/post_provider.dart';
import './screens/newsfeed_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PostProvider()..loadPostsFromLocalStorage(),
      child: MaterialApp(
        title: 'Newsfeed App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsfeedScreen(),
      ),
    );
  }
}