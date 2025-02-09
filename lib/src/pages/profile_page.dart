import 'package:flutter/material.dart';
import '../components/profile_listings.dart';
import '../components/profile_posts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  static const textColor = Color(0xff124642);
  static const btnColor = Color(0xff124642);
  static const btnSelectedColor = Color(0xFF27988E);
  static const buttonSize = 32.0;

  static const username = 'GoldGiratina';
  static const avatar = 'assets/images/test.png';
  static const rating = '4.98';
  static const ownPage = true;

  bool showListings = true;

  void changeToListings() {
    setState(() {
      showListings = true;
    });
  }

  void changeToPosts() {
    setState(() {
      showListings = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double padding = width / 5;

    String appBarText;
    Widget avatarArea;

    // Adjust profile if own
    if (ownPage) {
      appBarText = 'Your Profile';
      // Avatar, follow, and message buttons
      avatarArea = CircleAvatar(
        radius: 79,
        backgroundImage: AssetImage(avatar)
      );
    // Adjust profile if not own
    } else {
      appBarText = "$username's Profile";
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
      appBar: AppBar(title: Text(appBarText)),
      backgroundColor: Color(0xffeeeed2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Username
            Center(
              child: Container(
                padding: EdgeInsets.all(22),
                child: Text(
                  username,
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
                    rating,
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
                  color: showListings ? btnSelectedColor : btnColor,
                  padding: EdgeInsets.only(left: padding, right: padding),
                  onPressed: () {
                    changeToListings();
                  }
                ),
                IconButton(
                  icon: Icon(Icons.forum),
                  iconSize: buttonSize,
                  color: showListings ? btnColor : btnSelectedColor,
                  padding: EdgeInsets.only(left: padding, right: padding),
                  onPressed: () {
                    changeToPosts();
                  }
                )
              ]
            ),
            // Adjust area to show listings or forum posts
            showListings ? ProfileListings() : ProfilePosts()
          ]
        )
      )
    );
  }
}
