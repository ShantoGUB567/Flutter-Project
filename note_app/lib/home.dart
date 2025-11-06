import 'package:flutter/material.dart';
import 'package:note_app/note.dart';
import 'package:note_app/noteDatabase.dart';
import 'package:public_ip_address/public_ip_address.dart';
import 'package:platform_device_id/platform_device_id.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  // notes db
  final noteDatabase = NoteDatabase();

  // text controller
  final noteController = TextEditingController();

  // 🧠 Add new note
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
              final noteText = noteController.text.trim();

              if (noteText.isNotEmpty) {
                try {
                  // 🌐 Collect IP address
                  IpAddress ipAddress = IpAddress();
                  final ip = await ipAddress.getIp();
                  final country = await ipAddress.getCountry();

                  // 📱 Get device ID
                  // final deviceId = await PlatformDeviceId.getDeviceId ?? "Unknown";
                  final deviceId = await PlatformDeviceId.getDeviceId ?? "Unknown";


                  // 🧠 Create new note with extra info
                  final newNote = Note(
                    content: noteText,
                    ipAddress: ip,
                    country: country,
                    deviceId: deviceId,
                  );

                  // 💾 Save in database
                  await noteDatabase.createNote(newNote);
                } catch (e) {
                  debugPrint("❌ Error adding note: $e");
                }
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

  // 🧠 Edit note
  void editNote(Note note) {
    noteController.text = note.content;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Note"),
        content: TextField(
          controller: noteController,
          decoration: const InputDecoration(hintText: "Update your note"),
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
              final newText = noteController.text.trim();
              if (newText.isNotEmpty) {
                try {
                  await noteDatabase.updateNote(note, newText);
                } catch (e) {
                  debugPrint("❌ Error updating note: $e");
                }
              }
              Navigator.pop(context);
              noteController.clear();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  // 🧹 Delete a note
  void deleteNote(Note note) async {
    await noteDatabase.deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const Text("Note Book"),
        backgroundColor: Colors.teal,
      ),

      // Body
      body: SafeArea(
        child: StreamBuilder<List<Note>>(
          stream: noteDatabase.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final notes = snapshot.data!;

            if (notes.isEmpty) {
              return const Center(child: Text("No notes yet."));
            }

            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  color: Colors.white60,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(note.content),
                    // subtitle: Text(
                    //   "🌍 ${note.country} | 💻 ${note.deviceId}",
                    //   style: const TextStyle(fontSize: 12),
                    // ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => editNote(note),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteNote(note),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      // ➕ Add new note button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: addNewNote,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
