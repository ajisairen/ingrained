import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
class PostService {
  final tags = ["Crop", "Succulent", "Question", "General", "Meta"];
  
  final CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  // create
  
  Future<void> addPost({
    required String title,
    required String text,
    required String profile,
    List<String>? tags = const [],
    String? imgUrl,
    DateTime? date,
    int id = 1,
    int likes = 0,
    bool removed = false,
  }) {
    return posts.add({
      'title': title,
      'id': id,
      'text': text,
      'tags': tags,
      'imgUrl': imgUrl,
      'profile': profile,
      'date': date ?? DateTime.now(),
      'likes': likes,
      'removed': removed,
    });
  }
  // read
  Future<QuerySnapshot> fetchPosts() {
    return posts.get();
  }
  
  // update

  // delete
}