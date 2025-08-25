// lib/pages/Bab8.dart

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Model Class untuk Note
class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}

// Database Helper
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert('notes', note.toMap());
    return Note(id: id, title: note.title, content: note.content);
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes', orderBy: 'id DESC');
    return result
        .map(
          (json) => Note(
            id: json['id'] as int,
            title: json['title'] as String,
            content: json['content'] as String,
          ),
        )
        .toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;
    return db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

// Halaman utama untuk Bab 8
class Bab8 extends StatefulWidget {
  const Bab8({super.key});
  @override
  _Bab8State createState() => _Bab8State();
}

class _Bab8State extends State<Bab8> {
  late Future<List<Note>> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() {
    setState(() {
      _notesFuture = DatabaseHelper.instance.readAllNotes();
    });
  }

  Future<void> _showForm(BuildContext context, int? id) async {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    String buttonText = 'Tambah';

    if (id != null) {
      final notes = await _notesFuture;
      final existingNote = notes.firstWhere((note) => note.id == id);
      titleController.text = existingNote.title;
      contentController.text = existingNote.content;
      buttonText = 'Update';
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Judul'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(hintText: 'Isi Catatan'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await DatabaseHelper.instance.create(
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                } else {
                  await DatabaseHelper.instance.update(
                    Note(
                      id: id,
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                }
                Navigator.of(context).pop();
                _refreshNotes();
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Bab 8: Penyimpanan Lokal (SQLite)',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada catatan."));
          }

          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(context, note.id),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await DatabaseHelper.instance.delete(note.id!);
                            _refreshNotes();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(context, null),
      ),
    );
  }
}
