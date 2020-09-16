import 'package:flutter/material.dart';
import 'package:myapp/models/meals.dart';
import 'package:myapp/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
 final List<Meal> favMeal;
  FavoriteScreen(this.favMeal);
  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Container(child: Text('no fav yet'));
    } else {
      return ListView.builder(
          itemCount: favMeal.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favMeal[index].id,
              title: favMeal[index].title,
              duration: favMeal[index].duration,
              affordability: favMeal[index].affordability,
              imageUrl: favMeal[index].imageUrl,
              complexity: favMeal[index].complexity,
            );
          });
    }
  }
}   
