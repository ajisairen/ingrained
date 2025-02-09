import 'package:flutter/material.dart';
import 'marketplace_page.dart';

class BuySellPage extends StatelessWidget {
  const BuySellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Marketplace")),
        backgroundColor: Colors.green[100],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Marketplace")),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/cactus.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarketPage()),
                  );
                },
                child: Text('Buy'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text('Sell'),
              ),
            ],
          ),
        )));
  }
}
