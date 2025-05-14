import '../models/post.dart';

List<Post> allPosts = [
  Post(id: 1, title: 'First', body: 'Body 1'),
  Post(id: 2, title: 'Second', body: 'Body 2'),
  Post(id: 3, title: 'Third', body: 'Body 3'),
  Post(id: 4, title: 'Fourth', body: 'Body 4'),
];

String _filter = '' ; //private set, public get

List<Post> get filteredPosts => allPosts;
    // _filter.isEmpty
    //     ? allPosts
    //     : allPosts.where((p) =>
    //     p.title.toLowerCase().contains(_filter.toLowerCase())).toList();

// void setFilter(String value) {
//   _filter = value;
//   notifyListeners();
// }