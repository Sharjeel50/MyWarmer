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
      ),
      bottomNavigationBar: CategorySelector(),
      body: Column(
        children: [],
      ),
    );
  }
}
