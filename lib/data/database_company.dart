import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Company.dart';


class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = new DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseHelper;
  DatabaseHelper._internal();

  static Database? _database ;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE companies(id INTEGER PRIMARY KEY, name TEXT)',
    );
  }

  Future<int> insert(Company company) async {
    Database db = await _databaseHelper.database;
    return await db.insert(
      'companies',
      company.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Company>> queryAllRows() async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('companies');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Company.fromMap(maps[index]));
  }

  Future<int> lastId() async{
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('companies');
    return maps.length>0 ? List.generate(maps.length, (index) => Company.fromMap(maps[index])).last.id : 0;

  }



}
