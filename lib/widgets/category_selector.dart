import 'package:flutter/material.dart';
import 'package:MyWarmer/screens/home_screen.dart';
import 'package:MyWarmer/screens/preset_screen.dart';
import 'package:MyWarmer/screens/graphs_screen.dart';



class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  int _currentIndex = 0;
  final allTabs = [HomeScreen(), PresetScreen(), GraphsScreen()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Presets'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Graphs'),
              backgroundColor: Colors.lightBlue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            Navigator.push(context, MaterialPageRoute(builder: (context) => allTabs[_currentIndex]));
          });
        },
    );
  }
}
