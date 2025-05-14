import 'models/post.dart';

List<Post> filterPosts(List<Post> all, String query) {
  if (query.isEmpty) return all;
  final q = query.toLowerCase();
  return all.where((p) => p.title.toLowerCase().contains(q)).toList();
}