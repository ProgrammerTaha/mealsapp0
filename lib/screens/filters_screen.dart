import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  static final routName = '/FiltersScreen';
  late final saveFilters;
  final Map<String, bool?> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _glutenFree = false;
  bool? _lactoseFree = false;
  bool? _vegan = false;
  bool? _vegetarian = false;

  @override
  initState(){
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool?> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).popAndPushNamed(TabsScreen.routName);
            },
            icon: Icon(Icons.save),
          ),
        ],
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
                  _glutenFree!,
                  (bool val) => setState(() => _glutenFree = val),
                ),
                switchButtonLine(
                  'Lactose-Free',
                  'only include Lactose-Free meals',
                  _lactoseFree!,
                  (bool val) => setState(() => _lactoseFree = val),
                ),
                switchButtonLine(
                  'Vegan',
                  'only include Vegan meals',
                  _vegan!,
                  (bool val) => setState(() => _vegan = val),
                ),
                switchButtonLine(
                  'Vegetarian',
                  'only include Vegetarian meals',
                  _vegetarian!,
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
