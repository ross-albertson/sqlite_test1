import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Person.dart';

class DatabaseClient {
  Database _db;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "people.db");
    _db = await openDatabase(dbPath, version: 1, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE people (id INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT, last_name TEXT)');
    });
 //   await _create(_db, 1);

  }

/*
  Future _create(Database db, int version) async {
    await db.execute("""
    CREATE TABLE people (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL)""");
  }
*/
  Future close() async {
    await _db.close();

  }

  Future insertPerson(Person person) async {
    person.id = await _db.insert("people", person.toMap());
    return person;
    }

    Future fetchEveryone() async {
    List results = await _db.query("people", columns: Person.columns);
    List people = new List();
    results.forEach((map) {
      people.add(Person.fromMap(map));
    });
    return people;

    }
}