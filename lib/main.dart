import 'package:flutter/material.dart';
import 'src/components/nav_bar.dart';
import 'src/pages/forum_page.dart';
import 'src/pages/profile_page.dart';
import 'src/pages/buy_sell_page.dart';
// import 'src/pages/marketplace_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ingrained",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      routes: {
        '/buy_sell': (context) => const BuySellPage(),
        '/forum': (context) => const ForumPage(),
        '/profile': (context) => const ProfilePage(),
      },
      home: NavBar(),
    );
  }
}
