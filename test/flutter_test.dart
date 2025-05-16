import 'package:flutter_test/flutter_test.dart';
import 'package:posts_app/models/post.dart';
import 'package:posts_app/utilities/filter_utils.dart';

void main() {
  test('filterPosts возвращает только совпадающие заголовки', () {
    final posts = [
      Post(id: 1, title: 'Hello World', body: '...'),
      Post(id: 2, title: 'Flutter is great', body: '...'),
    ];
    final result = filterPosts(posts, 'flutter');
    expect(result.length, 1);
    expect(result.first.id, 2);
  });
}