import 'package:posts_app/models/post_response.dart';
import 'package:posts_app/providers/post_provider.dart';

class PostsUtility {
  final PostApi _api = PostApi();

  Future<PostResponse> fetchPosts() {
      return _api.fetchPosts();
  }
}