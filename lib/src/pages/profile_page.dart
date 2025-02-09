import 'package:flutter/material.dart';
import '../components/profile_listings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const textColor = Color(0xff124642);
  static const buttonSize = 32.0;

  static const ownPage = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool listingsSelected = true;
    Widget avatarArea;

    if (ownPage) {
      // Avatar, follow, and message buttons
      avatarArea = CircleAvatar(
        radius: 79,
        backgroundImage: AssetImage('assets/images/flutter_logo.png')
      );
    } else {
      // Avatar, follow, and message buttons
      avatarArea = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          // Avatar
          CircleAvatar(
            radius: 79,
            backgroundImage: AssetImage('assets/images/flutter_logo.png')
          ),
          // Follow and message buttons
          Column(
            spacing: 16,
            children: [
              FilledButton(
                child: Text('Follow'),
                onPressed: () {}
              ),
              FilledButton(
                child: Text('Message'),
                onPressed: () {}
              )
            ]
          )
        ]
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Your Profile')),
      backgroundColor: Color(0xffeeeed2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Username
            Center(
              child: Container(
                padding: EdgeInsets.all(22),
                child: Text(
                  'GoldGiratina',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor
                  )
                )
              ),
            ),
            avatarArea,
            // Rating
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4.98',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor
                    )
                  ),
                  Icon(
                    Icons.star,
                    color: textColor
                  )
                ]
              )
            ),
            // Listings/posts buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store),
                  iconSize: buttonSize,
                  padding: EdgeInsets.only(left: width / 5, right: width / 5),
                  onPressed: () {
                    listingsSelected = true;
                  },
                  isSelected: listingsSelected
                ),
                IconButton(
                  icon: Icon(Icons.forum),
                  iconSize: buttonSize,
                  padding: EdgeInsets.only(left: width / 5, right: width / 5),
                  onPressed: () {
                    listingsSelected = false;
                  },
                  isSelected: !listingsSelected,
                )
              ]
            ),
            ProfileListings()
          ]
        )
      )
    );
  }
}
