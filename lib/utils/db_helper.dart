import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "abc.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incexp(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT,amount TEXT,notes TEXT,paytypes TEXT,status INTEGER)";
        db.execute(query);
      },
    );
  }

  void insertData({
    required category,
    required amount,
    required notes,
    required paytypes,
    required status,
  }) async {
    database = await checkDB();
    database!.insert("incexp", {
      "category": category,
      "amount": amount,
      "notes": notes,
      "paytypes": paytypes,
      "status": status
    });
  }
}