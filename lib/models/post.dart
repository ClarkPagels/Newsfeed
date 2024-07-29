class Post {
  final String id;
  final String username;
  final String content;
  final DateTime timestamp;
  int likeCount;
  bool isLiked;

  Post({
    required this.id,
    required this.username,
    required this.content,
    required this.timestamp,
    this.likeCount = 0,
    this.isLiked = false,
  });
}