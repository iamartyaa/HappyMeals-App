import 'package:flutter/material.dart';
import 'package:happymeals/dummy_data.dart';
import 'package:happymeals/models/meal.dart';
import 'package:happymeals/screens/filters_screen.dart';
import 'package:happymeals/screens/meal_detail_screen.dart';
import 'package:happymeals/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filter ={
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals= DUMMY_MEALS;


  void _setFilters(Map<String,bool> filterData)
  {
    setState(() {
      _filter=filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filter['gluten']==true && !meal.isGlutenFree)
        {
          return false;
        }
        if(_filter['lactose']==true && !meal.isLactoseFree)
        {
          return false;
        }
        if(_filter['vegan']==true && !meal.isVegan)
        {
          return false;
        }
        if(_filter['vegetarian']==true && !meal.isVegetarian)
        {
          return false;
        }
        return true;
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HappyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      //home: const CategoriesScreen(),
      //initialRoute: ,
      routes: {
        '/': (context) => TabsScreen(),
        //'/category-meals':(context) => CategoryMealsScreen(), 
        CategoryMealsScreen.routeName :(context) => CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName:(context) => MealDetailScreen(), 
        FilterScreen.routeName:(context) => FilterScreen(filters: _filter,saveFilters: _setFilters),   
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context)=> CategoriesScreen(),);
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context)=> CategoriesScreen(),);
      // },
    );
  }
}
