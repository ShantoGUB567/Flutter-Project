import 'package:supabase_flutter/supabase_flutter.dart';
import 'note.dart';

class NoteDatabase {
  // Supabase table reference
  final database = Supabase.instance.client.from("Note");

  // Create note
  Future<void> createNote(Note newNote) async {
    await database.insert(newNote.toMap());
  }

  // Update note
  Future<void> updateNote(Note oldNote, String newContent) async {
    await database.update({"content": newContent}).eq('id', oldNote.id!);
  }

  // Delete note
  Future<void> deleteNote(Note note) async {
    await database.delete().eq('id', note.id!);
  }

  // Stream notes
  final stream = Supabase.instance.client
      .from('Note')
      .stream(primaryKey: ['id'])
      .order('id')
      .map((data) => data.map((noteMap) => Note.fromMap(noteMap)).toList());
}
