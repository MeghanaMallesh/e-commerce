import 'package:flutter/material.dart';
import 'package:myapp/dummy_data.dart';
import 'package:myapp/models/meals.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/category_meals_screen.dart';
import 'package:myapp/screens/filters_screen.dart';
import 'package:myapp/screens/meal_detail_screen.dart';
import 'package:myapp/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
   List<Meal> _favMeal = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFav(String id) {
    return _favMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //   home: CategoriesScreens(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(_favMeal),
          //  '/category_meals': (ctx) => CategoryMeals(),
          CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeal),
          //  _availableMeal),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_isMealFav, _toggleFav),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          //   return MaterialPageRoute(builder: (ctx) => CategoriesScreens());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreens());
        });
  }
}
