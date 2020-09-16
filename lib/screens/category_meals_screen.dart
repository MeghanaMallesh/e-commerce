import 'package:flutter/material.dart';
import 'package:myapp/dummy_data.dart';
import 'package:myapp/models/meals.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> _availableMeal;
  CategoryMeals(this._availableMeal);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
//
  var _loadInitData = false;
  String categoryTitle;
  List<Meal> displayedMeals;
  @override
  void initState() {
    // TODO: implement initSta
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget._availableMeal.where((meal) {
        return meal.category.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemCount: displayedMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                duration: displayedMeals[index].duration,
                affordability: displayedMeals[index].affordability,
                imageUrl: displayedMeals[index].imageUrl,
                complexity: displayedMeals[index].complexity,
                //   removeItem: _removeMeal,
              );
            }));
  }
}
