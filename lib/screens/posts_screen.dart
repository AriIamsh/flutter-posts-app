import 'package:flutter/material.dart';
import '../providers/provider.dart';

//todo: change to stateful?
class PostsScreen extends StatelessWidget {

  const PostsScreen({super.key});

  get fetchPosts => [];

  void filterItems(String query) {
    //todo filter
    print(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts'), centerTitle: true,),
      body:
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [searchField(), listOfPosts(context, false, null)],
            ),
          )
    );
  }

  Widget searchField() {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: SearchBar(
          onChanged: (query) => filterItems(query),
          hintText: 'Search posts',
          leading: Icon(Icons.search),
          padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16)),
          elevation: WidgetStatePropertyAll(1),
        ),
    );
  }

  Widget listOfPosts(
      BuildContext context,
      bool isLoading,
      String? error
      ) {
    return Expanded (
      child: Builder (
        builder: (_) {
          if (isLoading) return Center(child: CircularProgressIndicator());
          if (error != null) {
            return Center (
              child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading error'),
                  ElevatedButton(onPressed: fetchPosts, child: Text('Retry')),
                ], ),
            );
          }
          return ListView.builder(
            itemCount: filteredPosts.length,
            itemBuilder: (_, i) {
              final post = filteredPosts[i];
              return Card (
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile (
                  title: Text(post.title, style: TextStyle(fontWeight:
                  FontWeight.bold)),
                  subtitle: Text(post.body.split('\n').first),
                  onTap: () => Navigator.pushNamed(context, '/details',
                      arguments: post),
                ), );
            }, );
        }, ),
    );
  }
}