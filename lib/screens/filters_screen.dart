import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routName = '/FiltersScreen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget switchButtonLine(
    String title,
    String subtitle,
    bool identifier,
    void Function(bool)? switchHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: identifier,
      onChanged: switchHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
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
                switchButtonLine(
                  'Gluten-Free',
                  'only include Gluten-Free meals',
                  _glutenFree,
                  (bool val) => setState(() => _glutenFree = val),
                ),
                switchButtonLine(
                  'Lactose-Free',
                  'only include Lactose-Free meals',
                  _lactoseFree,
                  (bool val) => setState(() => _lactoseFree = val),
                ),
                switchButtonLine(
                  'Vegan',
                  'only include Vegan meals',
                  _vegan,
                  (bool val) => setState(() => _vegan = val),
                ),
                switchButtonLine(
                  'Vegetarian',
                  'only include Vegetarian meals',
                  _vegetarian,
                  (bool val) => setState(() => _vegetarian = val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
