import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './post_component.dart';

List<PostComponent> mockPosts = [
  const PostComponent(
      title: 'Test post title',
      content:
          'Test post content\nwith a new line\nand another line\n\nthis post is very big actually\nneed more data to fill here\nhmm',
      imageUrl:
          'https://img.freepik.com/free-vector/glowing-musical-pentagram-background-with-sound-notes_1017-31220.jpg?w=2000',
      allowComment: true)
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Feed'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ]),
      body: ListView.builder(
        itemCount: mockPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(child: mockPosts[index]);
        },
      ),
    );
  }
}
