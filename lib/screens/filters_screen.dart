import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtters-screen';
  final Function saveFilters;
  final Map<String,bool> currentFillters;
  FiltersScreen(this.currentFillters,this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFillters['gluten'];
    _vegan = widget.currentFillters['vegan'];
    _vegetarian = widget.currentFillters['vegetarain'];
    _lactoseFree = widget.currentFillters['loctose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String descrption,bool values, Function updatesValue){
    return SwitchListTile(
                  title: Text(title),
                  value: values,
                  subtitle: Text(descrption),
                  onChanged: updatesValue
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
           onPressed:(){
            final selectedFillters = {
            'gluten' : _glutenFree,
            'loctose': _lactoseFree,
            'vegan': _vegan,
            'vegetarain' : _vegetarian,
  };
              widget.saveFilters(selectedFillters);
           })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',style:Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
               _buildSwitchListTile(
                 'Gluten-Free',
                 'Only include gluten-free meals',
                 _glutenFree,
                 (newValues){
                    setState(() {
                      _glutenFree = newValues;
                    });
                 }),
               _buildSwitchListTile(
                 'Lactose-Free', 
                 'Only include gluten-free meals', 
                 _lactoseFree, 
                 (newValues){
                    setState(() {
                      _lactoseFree = newValues;
                    });
                 }),
                _buildSwitchListTile(
                 'Vegetarian', 
                 'Only include Vegetarian meals', 
                 _vegetarian, 
                 (newValues){
                    setState(() {
                      _vegetarian = newValues;
                    });
                 }),
                 _buildSwitchListTile(
                 'Vegan', 
                 'Only include Vegan meals', 
                 _vegan, 
                 (newValues){
                    setState(() {
                      _vegan = newValues;
                    });
                 }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
