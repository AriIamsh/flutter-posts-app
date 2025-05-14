import 'package:posts_app/models/post.dart';

class PostResponse {

  List<Post> posts;
  String? error;

  PostResponse({
    this.posts = const [],
    this.error
  });
}