import 'package:flutter/material.dart';
import 'package:product_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeAnimationDuration: Duration(seconds: 2),
      color: Colors.black12,
    );
  }
}
