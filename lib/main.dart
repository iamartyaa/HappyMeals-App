import 'package:flutter/material.dart';
import 'package:happymeals/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HappyMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreen(),
    );
  }
}