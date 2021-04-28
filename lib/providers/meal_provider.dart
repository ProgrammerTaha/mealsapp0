import 'package:flutter/material.dart';
import 'package:recipes_app/module/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> prefsMealId = [];

  toggleFavorite(mealId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefsMealId.removeAt(existingIndex);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    prefs.setStringList('prefsId', prefsMealId);
  }

  bool isFavorite(mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  void setFilters() async {
    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] == true && !meal.isGlutenFree) return false;
      if (filters['lactose'] == true && !meal.isLactoseFree) return false;
      if (filters['vegan'] == true && !meal.isVegan) return false;
      if (filters['vegetarian'] == true && !meal.isVegetarian) return false;
      return true;
    }).toList();

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('gluten', filters['gluten']!);
    prefs.setBool('lactose', filters['lactose']!);
    prefs.setBool('vegan', filters['vegan']!);
    prefs.setBool('vegetarian', filters['vegetarian']!);
  }

  void getFilters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    filters['gluten'] = prefs.getBool('gluten') ?? false;
    filters['lactose'] = prefs.getBool('lactose') ?? false;
    filters['vegan'] = prefs.getBool('vegan') ?? false;
    filters['vegetarian'] = prefs.getBool('vegetarian') ?? false;

    prefsMealId = prefs.getStringList('prefsId')!;

    for (var mealId in prefsMealId) {
      final existingIndex =
          favoriteMeals.indexWhere((meal) => meal.id == mealId);

      if (existingIndex < 0) {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }

    notifyListeners();
  }
}
