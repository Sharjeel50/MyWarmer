import 'dart:html';
import 'dart:io';
import 'package:path/path.dart';
import 'package:MyWarmer/models/preset.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'MyWarmerDB.db';
  static final _dbVersion = 1;

  static final _tableName = 'presets';
  static final _columnName = 'name';
  static final _columnTemp = 'temperature';
  static final _columnDateCreated = 'date_created';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute(
        ''' Create TABLE $_tableName ($_columnName TEXT PRIMARK KEY, $_columnTemp TEXT, $_columnDateCreated DATETIME) ''');
  }

  Future<int> insert(Preset preset) async {
    Database database = await instance.database;

    var preset_name = preset.name;
    var check = await database.query(''' SELECT * FROM $_tableName WHERE $_columnName LIKE $preset_name''');

    if(check.length < 0){
      return null;
    } else {
      return await database.rawInsert(
          ''' INSERT INTO $_tableName ($_columnName, $_columnTemp, $_columnDateCreated) VALUES (?, ?, ? )''',
          [preset.name, preset.temp, preset.datetime]);
    }
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database database = await instance.database;
    return await database.query(_tableName);
  }

  Future<dynamic> get() async {
    Database database = await instance.database;
    var result = await database.query(_tableName);
    if(result.length == 0){
      return null;
    } else {
      var resMap = result[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }

  Future update(Map<String, dynamic> row) async {
    Database database = await instance.database;
    int id = row[_columnName];
    return await database
        .update(_tableName, row, where: '$_columnName = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database database = await instance.database;
    return await database
        .delete(_tableName, where: '$_columnName = ?', whereArgs: [id]);
  }
}
