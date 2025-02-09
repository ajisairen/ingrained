import 'package:flutter/material.dart';
import '../components/listing.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    // This is just a sample listing bc idk how to incorporate a listing i made in app...
    Listing sampleListing = Listing(
      title: "Sample Item",
      desc: "This is a description of the sample item.",
      pic: "assets/images/plant.jpg",
      price: 99.99,
      date: DateTime.now(),
      category: [Category.cacti, Category.succulents],
      removed: false,
    );

    List<Listing> listings = List.generate(10, (index) => sampleListing);
    List<Listing> visibleListings =
        listings.where((listing) => !listing.removed).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Marketplace")),
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(2.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 0.2,
            mainAxisSpacing: 0.2,
            mainAxisExtent: 350, // Height of each item
          ),
          itemCount: visibleListings.length,
          itemBuilder: (context, index) {
            return ListingWidget(listing: visibleListings[index]);
          },
        ),
      ),
    );
  }
}
