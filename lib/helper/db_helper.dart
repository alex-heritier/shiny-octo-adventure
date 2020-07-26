/*
import 'package:chinese_fluent/model/word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBHelper {
  static const String DB_NAME = "main.db";

  static Future<Database> init() async => openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath(), DB_NAME),
        // When the database is first created, create a table to store words.
        onCreate: (db, version) {
          // Run the CREATE TABLE statement on the database.
          return db.execute('''
          CREATE TABLE words(
            id INTEGER PRIMARY KEY, 
            smpl TEXT, 
            trad TEXT
          )
        ''');
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );

  static void createWord(Word word) async {
    Database db = await init();

    // Define a function that inserts words into the database
    Future<void> insertWord(Word word) async {
      // Insert the word into the correct table. You might also specify the
      // `conflictAlgorithm` to use in case the same word is inserted twice.
      //
      // In this case, replace any previous data.
      await db.insert(
        'words',
        word.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Create a word and add it to the words table.
    final w = Word(
//      id: 0,
      simplified: word.simplified,
      traditional: word.traditional,
    );

    await insertWord(w);
  }

  static Future<List<Word>> getWords() async {
    // A method that retrieves all the dogs from the dogs table.
    Future<List<Word>> words() async {
      // Get a reference to the database.
      final Database db = await init();

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('words');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return Word(
          id: maps[i]['id'],
          simplified: maps[i]['smpl'],
          traditional: maps[i]['trad'],
        );
      });
    }

    final results = await words();
    return results;
  }
}
*/
