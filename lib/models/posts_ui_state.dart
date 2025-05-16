import 'package:flutter/material.dart';
import 'package:posts_app/utilities/posts_utility.dart';

import '../utilities/filter_utils.dart';
import 'post.dart';

class PostsUiState extends ChangeNotifier {

  final PostsUtility _utility = PostsUtility();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _filter = '' ;
  String get filter => _filter;

  List<Post> allPosts = [];
  String? error;

  List<Post> get filteredPosts => filterPosts(allPosts, filter);

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void fetchPosts() async {
    setLoading(true);

    final response = await _utility.fetchPosts();
    allPosts = response.posts;
    error = response.error;

    setLoading(false);
  }
}