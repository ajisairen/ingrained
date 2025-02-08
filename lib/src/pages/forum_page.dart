import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ForumPage")),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text("ForumPage."))],
        )
      )
    );
  }
}