import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../module/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty ? Center(
      child: Text('You have no favorites yet - start adding some!'),
    ): ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          imageUrl: favoriteMeals[index].imageUrl,
          title: favoriteMeals[index].title,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          ingredients: favoriteMeals[index].ingredients,
          steps: favoriteMeals[index].steps,
        );
      },
    );
  }
}
