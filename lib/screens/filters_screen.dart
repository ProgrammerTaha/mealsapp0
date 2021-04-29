import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import 'package:recipes_app/providers/theme_provider.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routName = '/FiltersScreen';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    String value,
    Map<String, bool?> currentFilters,
    BuildContext context,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      inactiveThumbColor:
          Provider.of<ThemeProvider>(context).tm == ThemeMode.dark
              ? Colors.black
              : null,
              activeColor: Provider.of<ThemeProvider>(context).tm == ThemeMode.dark
              ? Colors.white
              : null,
      value: currentFilters[value]!,
      onChanged: (bool val) {
        setState(() => currentFilters[value] = val);
        Provider.of<MealProvider>(context, listen: false).setFilters();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool?> currentFilters =
        Provider.of<MealProvider>(context).filters;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Filters')),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten-Free',
                  'only include Gluten-Free meals',
                  'gluten',
                  currentFilters,
                  context,
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  'only include Lactose-Free meals',
                  'lactose',
                  currentFilters,
                  context,
                ),
                buildSwitchListTile(
                  'Vegan',
                  'only include Vegan meals',
                  'vegan',
                  currentFilters,
                  context,
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'only include Vegetarian meals',
                  'vegetarian',
                  currentFilters,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
