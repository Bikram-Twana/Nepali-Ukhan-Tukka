import 'package:flutter/material.dart';
import 'package:nepali_ukhan_tukka/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Nepali Ukhan Tukka",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
