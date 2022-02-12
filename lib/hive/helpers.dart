import 'package:companion/hive/models/note_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Note> getNotes() =>
      Hive.box<Note>('notes');
}

class NoteHelper {

  static Future addNote(String title, String body, DateTime createdDate) async {
    final note = Note()
      ..title = title
      ..body = body
      ..createdDate = DateTime.now();

    final box = Boxes.getNotes();
    box.add(note);
  }

  static void editNote(
    Note note,
    String title,
    String body,
    DateTime createdDate,
  ) {
    note.title = title;
    note.body = body;
    note.createdDate = createdDate;

    note.save();
  }

  static void deleteNote(Note note) {
    note.delete();
  }

}