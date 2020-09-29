import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './cateogries_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  TabsScreen(this.favoritedMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;
  int _selectedPageindex=0;

  @override
  void initState() {
    _pages= [
    {
      'page': CategoriesScreen(),
      'title': 'Categories'
    },
    {
      'page' : Favorites(widget.favoritedMeals),
      'title': 'Your Favorites'
    }
  ];
    
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageindex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageindex]['page'],
        bottomNavigationBar:
        BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageindex,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Cateogries')
            ),
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites')
            )
          ],
        ) ,
      );
  }
}


/*
DefaultTabController(
      length: 2,
      child:Scaffold(
        appBar: AppBar(
          title:Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text:'Categories'
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            ),
          ]),
          ),
          body: TabBarView(children: <Widget>[
            CategoriesScreen(),
            Favorites(),
          ],),
      );

 */