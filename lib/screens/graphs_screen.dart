import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphsScreen extends StatefulWidget {
  @override
  _GraphsScreen createState() => _GraphsScreen();
}

class _GraphsScreen extends State<GraphsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Graphs page', style: TextStyle(fontSize: 28),), backgroundColor: Colors.lightBlue,),
    );
  }
}