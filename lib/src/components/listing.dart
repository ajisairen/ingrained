import 'package:flutter/material.dart';

enum Category {
  produce,
  herbs,
  succulents,
  cacti,
  flowers,
  shrubs,
  trees,
  vines,
  aquatic,
  indoor,
  outdoor,
  seeds,
  tools,
  pots,
  other
}

class Listing {
  String title;
  String desc;
  String pic;
  double price;
  // Location location;
  DateTime date;
  List<Category> category;
  bool removed;

  Listing({
    required this.title,
    required this.desc,
    required this.pic,
    required this.price,
    // required this.location,
    required this.date,
    required this.category,
    required this.removed,
  });

  String getTitle() => title;
  String getDesc() => desc;
  String getPic() => pic;
  double getPrice() => price;
  // Location getLocation() => location;
  DateTime getDate() => date;
  List<Category> getCategory() => category;
  bool getRemoved() => removed;

  void setTitle(String title) => this.title = title;
  void setDesc(String desc) => this.desc = desc;
  void setPic(String pic) => this.pic = pic;
  void setPrice(double price) => this.price = price;
  // void setLocation(Location loc) => this.location = loc;
  void setDate(DateTime date) => this.date = date;
  void setCategory(List<Category> cat) => category = cat;
  void setRemoved(bool rem) => removed = rem;
}

// Mapping of categories to their display names and icons
const Map<Category, String> categoryNames = {
  Category.produce: "Produce",
  Category.herbs: "Herbs",
  Category.succulents: "Succulents",
  Category.cacti: "Cacti",
  Category.flowers: "Flowers",
  Category.shrubs: "Shrubs",
  Category.trees: "Trees",
  Category.vines: "Vines",
  Category.aquatic: "Aquatic Plants",
  Category.indoor: "Indoor Plants",
  Category.outdoor: "Outdoor Plants",
  Category.seeds: "Seeds",
  Category.tools: "Tools",
  Category.pots: "Pots",
  Category.other: "Other",
};

// const Map<Category, IconData> categoryIcons = {
//   Category.produce: Icons.local_florist,
//   Category.herbs: Icons.grass,
//   Category.succulents: Icons.eco,
//   Category.cacti: Icons.local_florist,
//   Category.flowers: Icons.local_florist,
//   Category.shrubs: Icons.grass,
//   Category.trees: Icons.nature,
//   Category.vines: Icons.local_florist,
//   Category.aquatic: Icons.water,
//   Category.indoor: Icons.home,
//   Category.outdoor: Icons.park,
//   Category.seeds: Icons.grain,
//   Category.tools: Icons.build,
//   Category.pots: Icons.pot,
//   Category.other: Icons.category,
// };

class ListingWidget extends StatelessWidget {
  final Listing listing;

  const ListingWidget({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(0.0), // Custom padding for the image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                child: Image.asset(
                  "assets/images/plant.jpg", 
                  width:
                      double.infinity, // Make the image as wide as the widget
                  height: 150, // Fixed height of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              listing.getTitle(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(listing.getDesc(),
                maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('Price: \$${listing.getPrice()}'),
            // Text('Location: ${listing.getLocation().city}, ${listing.getLocation().state}'),
            Text('Date: ${listing.getDate().toLocal()}'),
            Text(
                'Category: ${listing.getCategory().map((category) => categoryNames[category]).join(', ')}'),
          ],
        ),
      ),
    );
  }
}
