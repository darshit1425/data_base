import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbHelper {
  Database? database;

  Future<Database?> checkDB() async {
    if (database == null) {
      return await createDB();
    } else {
      return database;
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'incomeexpense.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            'CREATE TABLE incomeexpense (id INTEGER PRIMARY KEY AUTOINCREMENT,Pname TEXT ,Pprice TEXT,Ptype TEXT,Pdate TEXT,ptime TEXT,status INTEGER)';
        db.execute(query);
      },
    );
  }

  Future<void> insertData({
    required  id,
    required Pname,
    required Pprice,
    required Ptype,
    required Pdate,
    required Ptime,
    required Status,
  })
  async {
    database = await checkDB();
    database!.insert('incomeexpense', {
      'id'   : id,
      'Pname': Pname,
      'Pprice': Pprice,
      'Ptype': Ptype,
      'Pdate': Pdate,
      'Ptime': Ptime,
      'Status': Status,
    });
  }


  Future<List<Map>> ReadData() async {
    database = await checkDB();
    String sql = "SELECT * FROM incomeexpense";
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }
}