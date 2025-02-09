import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/post_service.dart';
import 'package:ingrained/src/services/post_service.dart';
import 'package:ingrained/src/components/forum_post.dart';
import 'add_post_page.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});
  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
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
      appBar: AppBar(title: Text("ForumPage")),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
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
            List<Post> posts = snapshot.data!.docs.map((doc) {
              return Post(
                title: doc['title'],
                text: doc['text'],
                date: (doc['date'] as Timestamp).toDate(),
                likes: doc['likes'],
                imgUrl: Image.network(doc['imgUrl']),
                removed: doc['removed'],
              );
            }).toList();
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            );
          },
        ),
      ),
    );
  }
}