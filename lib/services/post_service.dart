import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_app/models/post.dart';

import '../models/post_response.dart';

class PostApi {

    static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

    static Future<PostResponse> fetchPosts() async {
      final url = Uri.parse('$_baseUrl/posts');

      try {
        final response = await http.get(url);

        if( response.statusCode == 200 ) {
          final List<dynamic> result = jsonDecode(response.body);
          final List<Post> posts = result.map(
              (json) => Post.fromJson(json)
          ).toList();

          print("Fetched posts length: ${posts.length}");
          print("Fetched posts first element: ${posts.first.title}");

          return PostResponse(posts: posts);
        } else {
          final message = 'Response code is ${response.statusCode}';

          print(message);

          return PostResponse(error: message);
        }
      } catch (e) {
        print('Exception caught: $e');

        return PostResponse(error: "Exception caught: $e");
      }
    }
}