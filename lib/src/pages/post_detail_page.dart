import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/post.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.post.likes;
  }

  void _incrementLikes() {
    setState(() {
      widget.post.increaseLikes();
      likes = widget.post.likes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: widget.post.img.image),
            SizedBox(height: 10),
            Text(widget.post.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
                'Date: ${DateFormat('yyyy/MM/dd - hh:mm').format(widget.post.date)}'),
            Text('Likes: $likes'),
            TextButton(
              onPressed: _incrementLikes,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 5),
                  Text('Like'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(widget.post.text),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
