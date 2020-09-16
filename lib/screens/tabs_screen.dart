import 'package:flutter/material.dart';
import 'package:myapp/models/meals.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/favorite_screen.dart';
import 'package:myapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favMeal;
  TabsScreen(this._favMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      //list of screens
      {'page': CategoriesScreens(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget._favMeal), 'title': 'Favorite'},
      // 'action':[FlatButton()]       //if we want to add to appbar
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        /*   DefaultTabController(
      length: 2,
      // initialIndex: 0,

      child:*/
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      /*   backgroundColor: Colors.pink,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ), */
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.blue,
        //  // selectedItemColor: Colors.teal,
        // //  unselectedItemColor: Colors.grey,
        //   selectedFontSize: 10,
        //   unselectedFontSize: 7,
        currentIndex: _selectedPageIndex,
        //    type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      /* TabBarView(
          children: <Widget>[
            CategoriesScreens(),
            FavoriteScreen(),
          ],
        ), */
      // ),
    );
  }
}
