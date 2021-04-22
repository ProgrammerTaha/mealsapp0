import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/meal_provider.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routName = '/FiltersScreen';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('only include Gluten-Free meals'),
                  value: currentFilters['gluten']!,
                  onChanged: (bool val) {
                    setState(() => currentFilters['gluten'] = val);
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  subtitle: Text('only include Lactose-Free meals'),
                  value: currentFilters['lactose']!,
                  onChanged: (bool val) {
                    setState(() => currentFilters['lactose'] = val);
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('only include Vegan meals'),
                  value: currentFilters['vegan']!,
                  onChanged: (bool val) {
                    setState(() => currentFilters['vegan'] = val);
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('only include Vegetarian meals'),
                  value: currentFilters['vegetarian']!,
                  onChanged: (bool val) {
                    setState(() => currentFilters['vegetarian'] = val);
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
