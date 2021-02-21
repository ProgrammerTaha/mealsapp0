import 'package:flutter/material.dart';
import 'package:meal_app0/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static final routName = '/MealDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as Map;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArg['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArg['title']),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              '${selectedMeal.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          Text('${routeArg["ingredients"]}'),
          Text('${routeArg["steps"]}'),
        ],
      ),
    );
  }
}
