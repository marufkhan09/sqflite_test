import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:local_db_test/models/book.dart';
import 'package:local_db_test/models/chapter.dart';
import 'package:local_db_test/models/hadith.dart';
import 'package:local_db_test/models/section.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart'; // Import your models

class DBHelper extends GetxController {
  static DBHelper? _instance;
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    _instance ??= DBHelper._internal();
    return _instance!;
  }

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "hadith_db.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // If it doesn't, copy from assets
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "db", "hadith_db.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }

  Future<List<Book>> getBooks() async {
    final db = await database;
    var res = await db.query('books');
    List<Book> list = res.isNotEmpty ? res.map((c) => Book.fromMap(c)).toList() : [];
    return list;
  }


  Future<List<Chapter>> getChapters() async {
    final db = await database;
    var res = await db.query('chapter');
    List<Chapter> list =
        res.isNotEmpty ? res.map((c) => Chapter.fromMap(c)).toList() : [];
    return list;
  }

    Future<List<Hadith>> getHadiths() async {
    final db = await database;
    var res = await db.query('hadith');
    List<Hadith> list = res.isNotEmpty ? res.map((c) => Hadith.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Section>> getSections() async {
    final db = await database;
    var res = await db.query('section');
    List<Section> list = res.isNotEmpty ? res.map((c) => Section.fromMap(c)).toList() : [];
    return list;
  }

 
}
