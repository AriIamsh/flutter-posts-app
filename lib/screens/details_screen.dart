import 'package:flutter/material.dart';

import '../models/post.dart';

class PostDetails extends StatelessWidget {

  const PostDetails({ super.key, required this.post });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${post.id}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: TextStyle(fontSize: 20, fontWeight:
            FontWeight.bold)),
            SizedBox(height: 12),
            Text(post.body),
          ],
        ), ),
    );
  }

}