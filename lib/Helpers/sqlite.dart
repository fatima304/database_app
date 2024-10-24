import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
     String path = join(await getDatabasesPath(), 'shop.db');
     return await openDatabase(
      path,
      version: 2,  
      onCreate: _onCreate,
     );
  }

   Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price REAL
      )
    ''');
    log("Products table created.");
  }

  

   Future<int> insertProduct(String name, double price) async {
    final db = await database;
    return await db.insert('products', {'name': name, 'price': price});
  }

   Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('products', orderBy: 'id DESC');
  }

   Future<void> deleteOldDatabase() async {
    String path = join(await getDatabasesPath(), 'shop.db');
    await deleteDatabase(path);
    log("Old database deleted.");
  }
}
