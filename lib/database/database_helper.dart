import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'MyWarmerDB.db';
  static final _dbVersion = 1;

  static final _tableName = 'presets';
  static final _columnID = '_id';
  static final _columnName = 'name';

  // static final _columnName_Temp = 'temperature';
  // static final _columnName_DateCreated = 'date_created';

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
    db.execute('''
        Create TABLE $_tableName 
        ($_columnID INTEGER PRIMARK KEY,
         $_columnName TEXT NOT NULL
         ) 
     ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database database = await instance.database;
    return await database.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database database = await instance.database;
    return await database.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database database = await instance.database;
    int id = row[_columnID];
    return await database
        .update(_tableName, row, where: '$_columnID = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database database = await instance.database;
    return await database
        .delete(_tableName, where: '$_columnID = ?', whereArgs: [id]);
  }
}
