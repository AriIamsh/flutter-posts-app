import 'package:flutter/material.dart';
import 'package:posts_app/screens/feedback_form_screen.dart';
import 'package:posts_app/screens/posts_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
    int _currentIndex = 0;

    final List<Widget> _tabs = [
        PostsScreen(),
        FeedbackFormScreen()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Posts'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment),
                label: 'Feedback'
            )
          ],
      ),
    );
  }
}