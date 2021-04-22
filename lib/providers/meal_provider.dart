import 'package:flutter/material.dart';
import 'package:recipes_app/module/meal.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool?> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  bool isMealFavorite= false;
   toggleFavorite(mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    isMealFavorite = favoriteMeals.any((meal) => meal.id == mealId);
    notifyListeners();
  }



  void setFilters() {
    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] == true && !meal.isGlutenFree) return false;
      if (filters['lactose'] == true && !meal.isLactoseFree) return false;
      if (filters['vegan'] == true && !meal.isVegan) return false;
      if (filters['vegetarian'] == true && !meal.isVegetarian) return false;
      return true;
    }).toList();
    notifyListeners();
  }
}
