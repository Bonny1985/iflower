import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider instance = DBProvider._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB();

    return _database;
  }

  Future<Database?> _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = documentDirectory.path + "flower_database.db";
    //String path =  "flower_database.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, ver) async {
      await db.execute("""CREATE TABLE flowers (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        description TEXT, 
        size TEXT, 
        color TEXT, 
        ts_ins TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )""");
    });
  }

  Future<void> close() async {
    return _database!.close();
  }
}
