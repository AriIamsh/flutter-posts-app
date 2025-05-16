import 'package:posts_app/models/post.dart';

class PostResponse {

  final List<Post> posts;
  final String? error;

  PostResponse({
    this.posts = const [],
    this.error
  });
}