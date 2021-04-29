// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import 'package:recipes_app/providers/theme_provider.dart';
import 'screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/themes_screen.dart';

void main() =>
// these lines for clear the shared preferences
/*
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
*/
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MealProvider>(
            create: (ctx) => MealProvider(),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (ctx) => ThemeProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;
    var tm = Provider.of<ThemeProvider>(context).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
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
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: 'Raleway',
        buttonColor: Colors.white70,
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        unselectedWidgetColor: Colors.white70,
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
      themeMode: tm,
      routes: {
        TabsScreen.routName: (context) => TabsScreen(),
        CategoriesScreen.routName: (context) => CategoriesScreen(),
        FiltersScreen.routName: (context) => FiltersScreen(),
        CategoryMealsScreen.routName: (context) => CategoryMealsScreen(),
        MealDetailsScreen.routName: (context) => MealDetailsScreen(),
        ThemesScreen.routName: (context) => ThemesScreen(),
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
