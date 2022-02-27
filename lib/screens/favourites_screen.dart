import 'package:flutter/material.dart';
import 'package:happymeals/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  
  FavouritesScreen(this.favMeals,) ;

  @override
  Widget build(BuildContext context) {
    if(favMeals.isEmpty){
    return const Center(
      child: Text('You Have no Favourites !'),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}