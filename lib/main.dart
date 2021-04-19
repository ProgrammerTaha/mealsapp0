import 'package:flutter/material.dart';
import 'dummy_data.dart';

import 'module/meal.dart';
import 'screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool?> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() => _favoriteMeals.removeAt(existingIndex));
    } else {
      setState(() => _favoriteMeals
          .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool?> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) return false;
        if (_filters['lactose'] == true && !meal.isLactoseFree) return false;
        if (_filters['vegan'] == true && !meal.isVegan) return false;
        if (_filters['vegetarian'] == true && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        TabsScreen.routName: (context) => TabsScreen(_favoriteMeals),
        CategoriesScreen.routName: (context) => CategoriesScreen(),
        FiltersScreen.routName: (context) =>
            FiltersScreen(_filters, _setFilters),
        CategoryMealsScreen.routName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routName: (context) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meals app'),
      ),
      body: null,
    );
  }
}
