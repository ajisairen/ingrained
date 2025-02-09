import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

class ProfileListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imgWidth = width * 0.3;

    List<Widget> listings = [];
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
              'assets/images/test.png',
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
