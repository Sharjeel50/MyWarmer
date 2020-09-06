import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PresetScreen extends StatefulWidget {
  @override
  _PresetScreen createState() => _PresetScreen();
}

class _PresetScreen extends State<PresetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Presets Nightly Temperatures',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.add,
                size: 20.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }
}
