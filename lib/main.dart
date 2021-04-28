// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import 'screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() =>
// these lines for clear the shared preferences
/*
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
 */
    runApp(
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
        fontFamily: 'Raleway',
        buttonColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline6: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: 'Raleway',
        buttonColor: Colors.white70,
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        textTheme: ThemeData.dark().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Colors.white60,
            ),
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      themeMode: ThemeMode.light,
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
