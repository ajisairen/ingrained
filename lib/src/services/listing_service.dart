import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/listing.dart' as listing;

class ListingService {
  final CollectionReference listings = FirebaseFirestore.instance.collection('listings');

  Future<void> addListing({
    required String title,
    required String pic,
    required double price,
    String desc = '',
    DateTime? date,
    List<String> category = const [],
    bool removed = false,
  }) {
    return listings.add({
      'title': title,
      'desc': desc,
      'pic': pic,
      'price': price,
      'date': date ?? DateTime.now(),
      'category': category.map((cat) => (cat)).toList(),
      'removed': removed,
    });
  }

  Future<List<listing.Listing>> fetchListings() async {
    QuerySnapshot snapshot = await listings.get();
    return snapshot.docs.map((doc) {
      return listing.Listing(
        title: doc['title'],
        desc: doc['desc'],
        pic: doc['pic'],
        price: doc['price'],
        date: doc['date'].toDate(),
        category: (doc['category'] as List<dynamic>)
            .map((cat) => listing.Category.values.firstWhere((e) => e.toString().split('.').last == cat))
            .toList(),
        removed: doc['removed'],        
      );
    }).toList();
  }
}