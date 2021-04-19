import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/module/meal.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final List<Meal> favoriteMeals = Provider.of<MealProvider>(context).favoriteMeals;
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
