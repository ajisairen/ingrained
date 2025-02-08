import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProfilePage!")),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text("ProfilePage."))],
        )
      )
    );
  }
}