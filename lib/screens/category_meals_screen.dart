import 'package:flutter/material.dart';
import '../module/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routName = '/CategoryMealsScreen';
  late final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context)?.settings.arguments as Map;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displayMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() => displayMeals.removeWhere((meal) => meal.id == mealId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemCount: displayMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            ingredients: displayMeals[index].ingredients,
            steps: displayMeals[index].steps,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
