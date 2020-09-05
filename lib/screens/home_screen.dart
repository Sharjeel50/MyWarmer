import 'package:MyWarmer/widgets/category_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentTime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyWarmer',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {}),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [CategorySelector()],
      ),
    );
  }
}
