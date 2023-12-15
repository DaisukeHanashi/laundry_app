import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id BIGINT PRIMARY KEY,
            name TEXT,
            email TEXT,
            password TEXT,
            phoneNumber TEXT
          )
        ''');

        await db.execute('''CREATE TABLE orders(
          id BIGINT PRIMARY KEY AUTO_INCREMENT, 
          orderType VARCHAR(30), 
          status INT, 
          custID BIGINT NOT NULL, 
          FOREIGN KEY (custID) REFERENCES users(id)
          provID BIGINT, 
          price DECIMAL(5,2),
          preferences ENUM,
          shopImage TEXT,
          address TEXT
        )
        ''');
      },
    );
  }
}
