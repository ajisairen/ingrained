import 'package:flutter/material.dart';
import '../components/post.dart';
import '../pages/post_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/post_service.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example of adding a new post
          postService.addPost(Post(
            title: "TEST POST239874298432U Post",
            text: "This is a new post.",
            imgUrl: Image.asset("assets/images/plant.jpg"),
            date: DateTime.now(),
            likes: 0,
            removed: false,)
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}