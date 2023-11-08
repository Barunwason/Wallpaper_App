import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screen/home.dart';
import 'package:wallpaper_app/view/screen/category.dart';
import 'package:wallpaper_app/view/screen/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wallpaper_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homescreen(),
    );
  }
}
