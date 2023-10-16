//Main.dart

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_task/dataBaseHelper.dart';
import 'package:sql_task/notes.dart';
import 'package:sql_task/student_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController rollno = TextEditingController();
  TextEditingController name = TextEditingController();
  int selectedId = -1;
  List<Notes> notes = [];

  _loadnotes() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final notelist = await databaseHelper.queryAll();
    setState(() {
      notes = notelist;
    });
  }

  Future<void> update(dynamic updatedData) async {
    if (updatedData != null && updatedData is Notes) {
      final updatedStudentIndex =
          notes.indexWhere((student) => student.id == updatedData.id);
      if (updatedStudentIndex != -1) {
        setState(() {
          notes[updatedStudentIndex] = updatedData;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadnotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('SQL Database'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 27,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: rollno,
                decoration: const InputDecoration(
                  labelText: "Rollno",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                ElevatedButton(
                  onPressed: () async {
                    DatabaseHelper dbHelper = DatabaseHelper();
                    Notes note = Notes(
                      rollno: rollno.text,
                      name: name.text,
                    );
                    await dbHelper.insert(note);
                    _loadnotes();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent),
                  child: const Text("Insert Task"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DatabaseHelper dbHelper = DatabaseHelper();
                    Notes note = Notes(
                      id: selectedId,
                      rollno: rollno.text,
                      name: name.text,
                    );
                    await dbHelper.update(note);
                    _loadnotes();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Student data updated.'),
                      duration: Duration(seconds: 2),
                    ));
                    rollno.text = '';
                    name.text = '';
                    setState(() {
                      selectedId = -1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent),
                  child: const Text("Update Task"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final updatedData = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Detail(),
                      ),
                    );
                    update(updatedData);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent),
                  child: const Text("List Of Students"),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

//Notes.dart

class Notes {
  int? id;
  String rollno;
  String name;
  Notes({this.id, required this.rollno, required this.name});
}

//student_details.dart

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_task/dataBaseHelper.dart';
import 'package:sql_task/notes.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => DetailState();
}

class DetailState extends State<Detail> {
  TextEditingController rollno = TextEditingController();
  TextEditingController name = TextEditingController();
  int selectedId = -1;
  List<Notes> notes = [];

  _loadnotes() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final notelist = await databaseHelper.queryAll();
    setState(() {
      notes = notelist;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadnotes();
  }

  void update2() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    Notes note = Notes(id: selectedId, rollno: rollno.text, name: name.text);

    if (selectedId == -1) {
      await dbHelper.insert(note);
    } else {
      await dbHelper.update(note);
    }
    Navigator.of(context).pop(note);
  }

  void search(String query) async {
    if (query.isEmpty) {
      _loadnotes();
    } else {
      DatabaseHelper dbHelper = DatabaseHelper();
      final searchResults = await dbHelper.searchStudents(query);
      setState(() {
        notes = searchResults;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('List Of Students'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                search(value);
              },
              decoration: const InputDecoration(
                hintText: "Search Students Here!...",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return ListTile(
                      title: Text(note.rollno),
                      subtitle: Text(note.name),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            DatabaseHelper dbHelper = DatabaseHelper();
                            await dbHelper.delete(note.id!);
                            _loadnotes();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            update2();
                          },
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//databasehelper.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_task/notes.dart';

class DatabaseHelper {
  static Database? _database;
  final String tablename = "notes";

  Future<Database> get dataBase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      return _database!;
    }
  }

  // Create database
  Future<Database> initDb() async {
    final dbpath = await getDatabasesPath();
    final db = join(dbpath, 'notes.db');
    return await openDatabase(db, version: 2, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE $tablename(id INTEGER PRIMARY KEY, rollno TEXT, name TEXT)");
    });
  }

  insert(Notes note) async {
    final db = await dataBase;

    Map<String, dynamic> notemap = {
      "id": note.id,
      "rollno": note.rollno,
      "name": note.name,
    };
    db.insert(tablename, notemap);
  }

  Future<List<Notes>> queryAll() async {
    final db = await dataBase;

    List<Map<String, dynamic>> maps = await db.query(tablename);
    return List.generate(
        maps.length,
        (index) => Notes(
              id: maps[index]["id"],
              rollno: maps[index]["rollno"],
              name: maps[index]["name"],
            ));
  }

  update(Notes note) async {
    final db = await dataBase;
    Map<String, dynamic> notemap = {
      "rollno": note.rollno,
      "name": note.name,
    };
    db.update(tablename, notemap, where: "id = ?", whereArgs: [note.id]);
  }

  delete(int id) async {
    final db = await dataBase;
    db.delete(tablename, where: "id=?", whereArgs: [id]);
  }

  Future<List<Notes>> searchStudents(String query) async {
    final db = await dataBase;

    List<Map<String, dynamic>> maps = await db.query(tablename,
        where: "name LIKE ? OR rollno LIKE ?",
        whereArgs: ['%$query%', '%$query%']);

    return List.generate(
      maps.length,
      (index) => Notes(
        id: maps[index]["id"],
        rollno: maps[index]["rollno"],
        name: maps[index]["name"],
      ),
    );
  }
}
