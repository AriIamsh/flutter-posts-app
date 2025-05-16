import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_app/models/post.dart';

import '../models/post_response.dart';

class PostApi {
     final String _baseUrl = 'https://jsonplaceholder.typicode.com';

     Future<PostResponse> fetchPosts() async {
      final url = Uri.parse('$_baseUrl/posts');

      try {
        final response = await http.get(url);

        if( response.statusCode == 200 ) {
          final List<dynamic> result = jsonDecode(response.body);
          final List<Post> posts = result.map(
              (json) => Post.fromJson(json)
          ).toList();

          return PostResponse(posts: posts, error: null);
        } else {
          final message = 'Response code is ${response.statusCode}';
          return PostResponse(error: message);
        }
      } catch (e) {
        return PostResponse(error: "Exception caught: $e");
      }
    }
}