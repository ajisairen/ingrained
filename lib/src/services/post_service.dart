import 'package:cloud_firestore/cloud_firestore.dart';
import "../components/post.dart";

class PostService {
  final tags = ["Crop", "Succulent", "Question", "General", "Meta"];
  
  final CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  // create
  
  Future<void> addPost(Post post) {
    return posts.add({
      'title': post.title,
      'id': post.id,
      'text': post.text,
      'tags': tags,
      'imgUrl': post.imgUrl.image.toString(),
      'date': post.date,
      'likes': post.likes,
      'removed': post.removed,
    });
  }
  // read
  Future<QuerySnapshot> fetchPosts() {
    return posts.get();
  }
  
  // update
  // delete
}