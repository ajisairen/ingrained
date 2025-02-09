import 'package:flutter/material.dart';
import '../components/post.dart';
import '../pages/post_detail_page.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List<Post> posts = List.generate(
    1,
    (index) => Post(
      title: "Sample Post AAAAAAAAAAAAAAAA",
      text:
          "This is a description of the sample post. I AM GOING OT OSDRaaAAAAAAAAAAAREMEEAANANNNDH UDHU WDAHDU AH UWAH DUHUWH AUHUWAHU WHDUAH UAHUAWH UWAH WUAH AWUHAWU HWAUHWAU HWU HAWU HWAU AWHUAWH AUWH AWU HAWU AHW UAWH AUWH AWU HAWU AHWU AH ",
      date: DateTime.now(),
      likes: 0,
      img: Image.asset("assets/images/plant.jpg"),
      removed: false,
    ),
  );

  void addPost(Post post) {
    setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(title: Text("ForumPage")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example of adding a new post
          addPost(Post(
            title: "New Post",
            text: "This is a new post.",
            img: Image.asset("assets/images/plant.jpg"),
            date: DateTime.now(),
            likes: 0,
            removed: false,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
