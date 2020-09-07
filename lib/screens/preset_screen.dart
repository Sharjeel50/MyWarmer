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
  @override
  void initState() {
    super.initState();
  }

  getPresets() async {
    List _presetData = await DatabaseHelper.instance.queryAll();
    List<Preset> returnPresets = [];

    for (var data in _presetData) {
      var temp = double.parse(data['temperature']);
      Preset a = Preset(name: data['name'], temperature: temp);
      returnPresets.add(a);
    }

    return returnPresets;
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
          Container(
            child: FutureBuilder(
                future: getPresets(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading.. "),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index].name),
                            subtitle: Text(snapshot.data[index].temperature.toString()),
                            onTap: () {
                              print(snapshot.data[index].name);
                            },
                          );
                        });
                  }
                }),
          ),
          // RawMaterialButton(
          //   onPressed: () {},
          //   elevation: 2.0,
          //   fillColor: Colors.white,
          //   child: Icon(
          //     Icons.add,
          //     size: 20.0,
          //   ),
          //   padding: EdgeInsets.all(15.0),
          //   shape: CircleBorder(),
          // ),
        ],
      ),
    );
  }
}
