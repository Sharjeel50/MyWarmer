import 'dart:io';
import 'package:path/path.dart';
import 'package:MyWarmer/models/preset.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'MyWarmerDB.db';
  static final _dbVersion = 1;

  static final _tableName = 'presets';
  static final columnID = 'id';
  static final columnName = 'name';
  static final columnTemp = 'temperature';

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

  // Working
  Future _onCreate(Database db, int version) {
    db.execute(
        ''' Create TABLE $_tableName ($columnID INTEGER PRIMARY KEY, $columnName TEXT PRIMARK KEY, $columnTemp TEXT) ''');

    // Add some default presets for users to choose from
    db.rawQuery(
        ''' INSERT INTO $_tableName ($columnName, $columnTemp) VALUES ("Night Time", 35.0), ("Mid day", 25.0), ("Afternoon", 23.0)''');
  }

  // Working
  Future<int> insert(Preset preset) async {
    Database database = await instance.database;

    var presetName = preset.name;
    var check = await database.rawQuery(
        ''' SELECT * FROM $_tableName WHERE $columnName LIKE "$presetName"''');

    return check.length == 0
        ? await database.rawInsert(
            ''' INSERT INTO $_tableName ($columnName, $columnTemp) VALUES (?, ?)''',
            [preset.name, preset.temperature])
        : null;
  }

  // Working
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database database = await instance.database;
    return await database.rawQuery("SELECT * FROM $_tableName;");
  }

  // Working
  Future<dynamic> get(int id) async {
    Database database = await instance.database;

    dynamic result = await database.rawQuery(
        '''SELECT * FROM $_tableName WHERE $columnID = "$id"''');
    return result.lenght == 1 ? result : null;
  }

  // Working
  Future update(Map<String, dynamic> row) async {
    Database database = await instance.database;
    String id = row[int];
    return await database
        .update(_tableName, row, where: '$columnID = ?', whereArgs: [id]);
  }

  // Working
  Future<int> delete(int id) async {
    Database database = await instance.database;
    return await database
        .delete(_tableName, where: '$columnID = ?', whereArgs: [id]);
  }
}
