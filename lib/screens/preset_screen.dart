import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MyWarmer/models/preset.dart';
import 'package:MyWarmer/database/database_helper.dart';
import 'package:MyWarmer/widgets/category_selector.dart';

class PresetScreen extends StatefulWidget {
  @override
  _PresetScreen createState() => _PresetScreen();
}

class _PresetScreen extends State<PresetScreen> {
  Map<String, String> newPreset = {};
  Future _presetFuture;

  @override
  void initState() {
    super.initState();
    _presetFuture = getPresets();
  }

  getPresets() async {
    List _presetData = await DatabaseHelper.instance.queryAll();
    return _presetData;
  }

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
      bottomNavigationBar: CategorySelector(),
      body: Column(
        children: [
          for (var preset in getPresets()) Text("New ${preset.data}"),
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
      ),
    );
  }
}
