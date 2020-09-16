import 'package:flutter/material.dart';
import 'package:myapp/screens/tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentMeals;
  FiltersScreen(this.currentMeals, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        //('Only include glutenFree Meals.'),
        onChanged: updateValue);
  }

  bool _vegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;
  bool glutenFree = false;

  @override
  void initState() {
    _vegan = widget.currentMeals['vegan'];
    vegetarian = widget.currentMeals['vegetarian'];
    lactoseFree = widget.currentMeals['lactose'];
    glutenFree = widget.currentMeals['gluten'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: true,
        
          title: Text(''),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': glutenFree,
                    'vegan': _vegan,
                    'vegetarian': vegetarian,
                    'lactose': lactoseFree,
                  };
                  widget.saveFilters(selectedFilters);
                }),
                
          ],
          
        ),

        //  drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.'),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Gluten', 'Only include glutenFree Meals.', glutenFree,
                      (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'lactose', 'Only include lactoseFree Meals.', lactoseFree,
                      (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                  buildSwitchListTile('Vegetarian',
                      'Only include vegetarian Meals.', vegetarian, (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'vegan', 'Only include vegan Meals.', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
