import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';
import 'features/home2/home_screen2.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen2(),
    );
  }
}
