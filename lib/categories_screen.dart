import 'package:flutter/material.dart';
import 'package:happymeals/category_item.dart';

import 'package:happymeals/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HappyMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(22),
        children: [
          ...DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(id: catData.id,title: catData.title, color: catData.color);
          }).toList(),
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
