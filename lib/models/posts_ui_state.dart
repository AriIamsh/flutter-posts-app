import 'package:flutter/material.dart';
import 'package:posts_app/utilities/posts_utility.dart';

import 'post.dart';

class PostsUiState extends ChangeNotifier {

  final PostsUtility _utility = PostsUtility();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _filter = '' ;
  String get filter => _filter;

  List<Post> allPosts = [];

  List<Post> get filteredPosts => _filter.isEmpty ? allPosts : allPosts.where((p) => p.title.toLowerCase().contains(_filter.toLowerCase())).toList();

  String? error;

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