import 'package:flutter/material.dart';
import '../pages/profile_page.dart';
import 'dart:math';

class ProfileListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imgWidth = width * 0.3;
    List<String> images = ['assets/images/carrots.jpg', 'assets/images/leeks.jpg', 'assets/images/potatoes.jpg'];
    List<Widget> listings = [];
    Random random = Random();
    for (var i = 0; i < 15; i++) {
      listings.add(
        SizedBox(
          width: imgWidth,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Image.asset(
              images[random.nextInt(images.length)],
              fit: BoxFit.cover
            )
          )
        )
      );
    }
    
    return Column(
      children: [
        Wrap (
          spacing: 8,
          runSpacing: 8,
          children: listings
        )
      ]
    );
  }
}
