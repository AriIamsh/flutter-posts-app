import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/posts_ui_state.dart';

class PostsScreen extends StatefulWidget {

  const PostsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  
  @override
  Widget build(BuildContext context) {

    final postsState = Provider.of<PostsUiState>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Posts'), centerTitle: true,),
      body:
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [searchField(postsState), listOfPosts(context, postsState)],
            ),
          )
    );
  }

  Widget searchField(PostsUiState state) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: SearchBar(
          onChanged: (query) => state.setFilter(query),
          hintText: 'Search posts',
          leading: Icon(Icons.search),
          padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16)),
          elevation: WidgetStatePropertyAll(1),
          autoFocus: false,
        ),
    );
  }

  Widget listOfPosts(
      BuildContext context,
      PostsUiState state,
      ) {
    return Expanded (
      child: Builder (
        builder: (_) {
          if (state.isLoading) return Center(child: CircularProgressIndicator());
          if (state.error != null) {
            return Center (
              child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading error'),
                  ElevatedButton(onPressed: state.fetchPosts, child: Text('Retry')),
                ], ),
            );
          }
          return ListView.builder(
            itemCount: state.filteredPosts.length,
            itemBuilder: (_, i) {
              final post = state.filteredPosts[i];
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