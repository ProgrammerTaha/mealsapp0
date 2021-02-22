import 'package:flutter/material.dart';
import '../module/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  late final String imageUrl;
  late final String title;
  late final Affordability affordability;
  late final Complexity complexity;
  late final int duration;
  late final List ingredients;
  late final List steps;
  late final String id;
  late final Function removeItem;

  MealItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.ingredients,
    required this.steps,
    required this.removeItem,
  });

  String? get complexityText {
    switch (complexity.index) {
      case 0:
        return 'Simple';
      case 1:
        return 'Challenging';
      case 2:
        return 'Hard';
      default:
        return 'unknown';
    }
  }

  String? get affordabilityText {
    switch (complexity.index) {
      case 0:
        return 'Affordable';
      case 1:
        return 'Pricey';
      case 2:
        return 'Luxurious';
      default:
        return 'unknown';
    }
  }

  void selectMeal(BuildContext context) =>
      Navigator.of(context).pushNamed(MealDetailsScreen.routName, arguments: {
        'id': id,
        'title': title,
        'ingredients': ingredients,
        'steps': steps,
        'imageUrl': imageUrl,
      }).then((result) {
        if (result != null) removeItem(result);
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
