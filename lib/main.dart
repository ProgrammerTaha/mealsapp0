import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import 'screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(
      ChangeNotifierProvider<MealProvider>(
        create: (ctx) => MealProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
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
            bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
            headline6: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        TabsScreen.routName: (context) => TabsScreen(),
        CategoriesScreen.routName: (context) => CategoriesScreen(),
        FiltersScreen.routName: (context) => FiltersScreen(),
        CategoryMealsScreen.routName: (context) => CategoryMealsScreen(),
        MealDetailsScreen.routName: (context) => MealDetailsScreen(),
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
