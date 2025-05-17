import 'package:flutter/material.dart';
import 'package:posts_app/models/feedback_form_ui_state.dart';
import 'package:posts_app/models/post.dart';
import 'package:posts_app/models/posts_ui_state.dart';
import 'package:posts_app/screens/details_screen.dart';
import 'package:posts_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {

  final postsUIState = PostsUiState();
  postsUIState.fetchPosts();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: postsUIState),
        ChangeNotifierProvider(create: (_) => FeedbackFormUiState())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Posts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
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
