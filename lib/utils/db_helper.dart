import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Database? database;

  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

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
            "CREATE TABLE incexp(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT,amount TEXT,notes TEXT,paytypes TEXT,status INTEGER,date TEXT,time TEXT)";
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
    required date,
    required time,
  }) async {
    database = await checkDB();
    database!.insert("incexp", {
      "category": category,
      "amount": amount,
      "notes": notes,
      "paytypes": paytypes,
      "status": status,
      "date": date,
      "time": time,
    });
    database!.update("incexp", {
      "category": category,
      "amount": amount,
      "notes": notes,
      "paytypes": paytypes,
      "status": status,
      "date": date,
      "time": time,
    },whereArgs: ["id"],where: "id=?");
  }

  // Future<List> ReadData() async {
  //   database = await checkDB();
  //   String query = "SELECT * FROM incexp";
  //
  //   List dataList = await database!.rawQuery(query);
  //   print(dataList);
  //   return dataList;
  // }

  Future<List<Map>> ReadData() async {
    database = await checkDB();

    String query = "SELECT * FROM incexp";
    List<Map> list = await database!.rawQuery(query);
    print("${list}");
    return list;
  }

  Future<List<Map<String, Object?>>> FilterData({required status}) {
    String quary = "SELECT * FROM incexp WHERE status=$status";
    return database!.rawQuery(quary);
  }

  Future<void> deleteData({required id}) async {
    database = await checkDB();
    database!.delete("incexp", where: "id=?", whereArgs: [id]);
  }

//     UPDATE DATA
  void updateData({
    required id,
    required category,
    required amount,
    required notes,
    required paytypes,
    required status,
    required date,
    required time,
  }) {
    database!.update(
        "incexp",
        {
          "category": category,
          "amount": amount,
          "notes": notes,
          "paytypes": paytypes,
          "status": status,
          "date": date,
          "time": time,
        },
        whereArgs: [id],
        where: "id=?");
  }
}
