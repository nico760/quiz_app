import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/score.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async { //con este método creo la Base de datos 
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'scores.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE scores(ntry INTEGER PRIMARY KEY AUTOINCREMENT, nscore INTEGER)');
  }

  Future<List<Score>> getScore() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('scores');
    return List.generate(maps.length, (i) {
      return Score.fromMap(maps[i]);
    });
  }

  Future<int> insert(Score score) async {
    final Database db = await instance.database;
    return await db.insert('scores', score.toMap());
  }
  Future<void> clearScores() async{
    final Database db = await instance.database;
    await db.delete('scores');
  }

}
