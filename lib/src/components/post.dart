import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../pages/post_detail_page.dart';

class Post {
  String title;
  int id;
  String text;
  Image imgUrl;
  // Profile profile;
  DateTime date;
  int likes;
  bool removed;

  Post({
    this.title = "",
    this.id = 0,
    this.text = "",
    required this.imgUrl,
    // required this.profile,
    required this.date,
    this.likes = 0,
    this.removed = false,
  });

  String getTitle() => title;
  int getId() => id;
  String getText() => text;
  Image getImage() => imgUrl;
  // Profile getProfile() => profile;
  DateTime getDate() => date;
  int getLikes() => likes;
  bool getRemoved() => removed;

  void setTitle(String title) {
    this.title = title;
  }

  void setId(int id) {
    this.id = id;
  }

  void setText(String text) {
    this.text = text;
  }

  void setimgUrl(Image imgUrl) {
    this.imgUrl = imgUrl;
  }

  // void setProfile(Profile profile) {
  //   this.profile = profile;
  // }
  void setDate(DateTime date) {
    this.date = date;
  }

  void increaseLikes() {
    likes++;
  }

  void setRemoved(bool removed) {
    this.removed = removed;
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Format the date to only show the date part
    String formattedDate = DateFormat('yyyy-MM-dd').format(post.date);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(post: post),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 100, // Fixed width for the thumbnail
                height: 100, // Fixed height for the thumbnail
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  // child: Image(image: post.imgUrl.image, fit: BoxFit.cover),
                  child: Image(image: AssetImage("assets/images/plant.jpg"), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10), // Add padding between the image and the text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('$formattedDate · ${post.likes} likes',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text(post.text,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
