import 'package:flutter/material.dart';
import '../components/listing.dart';
import "../services/listing_service.dart";

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Future<List<Listing>> futureListings;
  ListingService service = ListingService();
  @override
  void initState() {
    super.initState();
    futureListings = ListingService().fetchListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marketplace")),
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: FutureBuilder<List<Listing>>(
          future: futureListings,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No listings available'));
            } else {
              List<Listing> visibleListings = snapshot.data!
                  .where((listing) => !listing.removed)
                  .toList();
              return GridView.builder(
                padding: const EdgeInsets.all(2.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.2,
                  mainAxisSpacing: 0.2,
                  mainAxisExtent: 350,
                ),
                itemCount: visibleListings.length,
                itemBuilder: (context, index) {
                  return ListingWidget(listing: visibleListings[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}