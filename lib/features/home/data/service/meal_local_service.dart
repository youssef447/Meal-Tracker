import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MealLocalService {
  final String _dbName = "MealDatabase.db";

  final String _mealTableName = "Meals";

  Database? _database;

  Future<void> initializeDB() async {
    if (_database != null) {
      return;
    }

    String path = await getDatabasesPath();

    _database = await openDatabase(
      join(path, _dbName),
      onCreate: (database, version) async {
        await database.execute(
          """CREATE TABLE $_mealTableName(
              id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, image BLOB, time text NOT NULL, calories REAL NOT NULL
              )""",
        );
      },
      version: 1,
    );
  }

  Future<void> saveMeal(Map<String, dynamic> query) async {
    await initializeDB();
    await _database!.transaction(
      (txn) => txn.insert(
        _mealTableName,
        query,
      ),
    );
  }

  Future<List<Map>> getMeals() async {
    await initializeDB();
    //database.rawQuery('select* from $table');
    final List<Map> data = await _database!.query(
      _mealTableName,
    );

    return data;
  }

  Future<void> updateMeal(
      {required int id, required Map<String, dynamic> query}) async {
    await initializeDB();
    await _database!.update(
      _mealTableName,
      query,
      where: 'id= ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteMeal(int id) async {
    await initializeDB();
    await _database!.delete(
      _mealTableName,
      where: "id= ?",
      whereArgs: [id],
    );
  }
}
