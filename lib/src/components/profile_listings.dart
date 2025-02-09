import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

class ProfileListings extends StatelessWidget {
  static const priceColor = Colors.white;
  static const priceBkgColor = Color(0xff124642);

  const ProfileListings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imgWidth = width * 0.3;

    List<Widget> listings = [];
    for (var i = 0; i < 15; i++) {
      listings.add(
        SizedBox(
          width: imgWidth,
          height: imgWidth,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Stack (
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/test.png',
                  fit: BoxFit.cover
                ),
                Text(
                  '\$0.01',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: priceColor,
                    backgroundColor: priceBkgColor,
                  )
                )
              ]
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
