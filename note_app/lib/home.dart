import 'package:flutter/material.dart';
import 'note.dart';
import 'noteDatabase.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final noteDatabase = NoteDatabase();
  final noteController = TextEditingController();

  // Add new note
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Note"),
        content: TextField(
          controller: noteController,
          decoration: const InputDecoration(hintText: "Enter your note"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              noteController.clear();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final newNote = Note(content: noteController.text.trim());
              if (newNote.content.isNotEmpty) {
                await noteDatabase.createNote(newNote);
              }
              Navigator.pop(context);
              noteController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Book"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Expanded(
          child: StreamBuilder<List<Note>>(
            stream: noteDatabase.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final notes = snapshot.data!;

              if (notes.isEmpty) {
                return const Center(
                  child: Text("No notes yet!"),
                );
              }

              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note.content),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Edit button
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            noteController.text = note.content;
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Edit Note"),
                                content: TextField(
                                  controller: noteController,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      noteController.clear();
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final newContent =
                                      noteController.text.trim();
                                      if (newContent.isNotEmpty) {
                                        await noteDatabase.updateNote(
                                            note, newContent);
                                      }
                                      Navigator.pop(context);
                                      noteController.clear();
                                    },
                                    child: const Text("Update"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        // Delete button
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await noteDatabase.deleteNote(note);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: addNewNote,
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
