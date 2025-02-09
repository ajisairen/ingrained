import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ingrained/src/services/post_service.dart';
import 'package:ingrained/src/components/forum_post.dart';
import 'add_post_page.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});
  @override
  State<ForumPage> createState() => ForumPageState();
}

class ForumPageState extends State<ForumPage> {
  final PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostPage()),
          );
        },
        child: const Icon(Icons.note),
      ),
      backgroundColor: Colors.green[100],
      appBar: AppBar(foregroundColor: Colors.green),
      body: FutureBuilder<QuerySnapshot>(
        future: postService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No posts available'));
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ForumPost(
                title: doc['title'],
                text: doc['text'],
                tags: List<String>.from(doc['tags']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}