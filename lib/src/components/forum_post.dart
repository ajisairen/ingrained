import 'package:flutter/material.dart';

class ForumPost extends StatelessWidget {
  final String title;
  final String text;
  final List tags;

  const ForumPost({
    Key? key,
    required this.title,
    required this.text,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(text),
            ),
            Wrap(
              children: tags.map((tag) => Chip(label: Text(tag))).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(30),
          ),
        ],
      ),
    );
  }
}