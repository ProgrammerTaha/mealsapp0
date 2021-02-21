import 'package:flutter/material.dart';
import 'package:meal_app0/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routName = '/CategoryMealsScreen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context)?.settings.arguments as Map;
    final categoryId = routArg['id'];
    final categoryTitle = routArg['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
      ),
    );
  }
}
