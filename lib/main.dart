import 'package:flutter/material.dart';
import 'package:posts_app/models/post.dart';
import 'package:posts_app/models/posts_ui_state.dart';
import 'package:posts_app/screens/details_screen.dart';
import 'package:posts_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {

  final postsUIState = PostsUiState();
  postsUIState.fetchPosts();

  runApp(
    ChangeNotifierProvider(
        create: (_) => postsUIState,
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Posts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        if(settings.name == '/details') {
          return MaterialPageRoute(
              builder: (context) => PostDetails(post: settings.arguments as Post)
          );
        }
        return MaterialPageRoute(
            builder: (context) => HomeScreen()
        );
      },
    );
  }
}
