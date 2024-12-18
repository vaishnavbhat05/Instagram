import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user_data.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_data.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        // Create the users table
        await db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name TEXT,
          last_name TEXT,
          email TEXT UNIQUE,
          phone TEXT UNIQUE,
          password TEXT
        )
      ''');
        // Create followings table (linked to user_id)
        await db.execute('''
          CREATE TABLE followings(
            user_id INTEGER,
            following_name TEXT,
            PRIMARY KEY (user_id, following_name),
            FOREIGN KEY (user_id) REFERENCES users(id)
          )
          
        ''');
        // Create a followers table for all available followers
        await db.execute('''
          CREATE TABLE followers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT UNIQUE,
            initials TEXT
          )
        ''');
        // Insert initial followers
        final initialFollowers = [
          {'name': 'Elon Musk', 'initials': 'EM'},
          {'name': 'Kanye West', 'initials': 'KW'},
          {'name': 'Tom Cruise', 'initials': 'TC'},
          {'name': 'Kobe Bryant', 'initials': 'KB'},
          {'name': 'Tom Hanks', 'initials': 'TH'},
          {'name': 'Lebron James', 'initials': 'LJ'},
          {'name': 'Michael Jordan', 'initials': 'MJ'},
          {'name': 'Joe George', 'initials': 'JR'},
          {'name': 'KM Peterson', 'initials': 'KMP'},
          {'name': 'Oprah Winfrey', 'initials': 'OW'},
        ];

        for (var follower in initialFollowers) {
          await db.insert('followers', follower,
              conflictAlgorithm: ConflictAlgorithm.ignore);
        }
      },
      version: 1,
    );
  }

  // Insert a new follower into the followers table
  Future<void> insertFollower(String name, String initials) async {
    final db = await database;
    await db.insert(
      'followers',
      {'name': name, 'initials': initials},
      conflictAlgorithm: ConflictAlgorithm.ignore, // Avoid duplicates
    );
  }
  // Retrieve all followers
  Future<List<Map<String, String>>> getFollowers() async {
    final db = await database;
    final result = await db.query('followers');
    return result.map((row) => {
      'name': row['name'] as String,
      'initials': row['initials'] as String,
    }).toList();
  }


  // Insert user data into the database
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<bool> isEmailUnique(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isEmpty;
  }

  Future<bool> isPhoneUnique(String phone) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'phone = ?',
      whereArgs: [phone],
    );
    return result.isEmpty;
  }

  // Get user by email and password for login
  Future<User?> getUserByEmailAndPassword(String email, String password) async {
    final db = await database;
    var result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
  Future<void> addFollowing(int userId, String followingName) async {
    final db = await database;
    await db.insert(
      'followings',
      {'user_id': userId, 'following_name': followingName},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<void> removeFollowing(int userId, String followingName) async {
    final db = await database;
    await db.delete(
      'followings',
      where: 'user_id = ? AND following_name = ?',
      whereArgs: [userId, followingName],
    );
  }

  Future<List<String>> getFollowings(int userId) async {
    final db = await database;
    final result = await db.query(
      'followings',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return result.map((e) => e['following_name'] as String).toList();
  }

  Future<Map<String, String>> getUserDetailsById(int userId) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
      limit: 1,
    );
    if (result.isNotEmpty) {
      final user = result.first;
      return {
        'first_name': user['first_name'] as String,
        'last_name': user['last_name'] as String,
        'email': user['email'] as String,
        'phone': user['phone'] as String? ?? 'N/A',
      };
    }
    throw Exception("User not found.");
  }
}
