import 'package:flutter/material.dart';
import 'package:happymeals/models/meal.dart';
import 'package:happymeals/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen({required this.availableMeals});


  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;

  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];

    categoryMeals = widget.availableMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere(
        (meal) {
          return meal.id == id;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
