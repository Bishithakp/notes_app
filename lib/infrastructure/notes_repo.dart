import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/domain/notes_model.dart';

abstract class NotesRepository {
  Future<List<NotesModel>> getAllNotes();

  Future<String> addNote(NotesModel note);

  Future<void> deleteNote(int noteId);
}

class LocalNoteRepository implements NotesRepository {
  late CollectionReference notesRef;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  connectionWithNotesCollection() {
    notesRef = firebaseFirestore.collection('notes');
  }

  @override
  Future<String> addNote(NotesModel note) async {
    connectionWithNotesCollection();
    String msg = "";
    await notesRef.add(note.toMap()).then((value) {
      msg = "User added successfully!";
    }).catchError((error) {
      msg = "Failed to add user: $error";
    });
    return msg;
  }

  @override
  Future<List<NotesModel>> getAllNotes() async {
    try {
      connectionWithNotesCollection();
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('notes')
          .orderBy('created_date', descending: true)
          .get();
      List<NotesModel> notesList = [];
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      if (allData.isNotEmpty) {
        for (var element in allData) {
          Map<String, dynamic> val = element as Map<String, dynamic>;
          NotesModel notesModel = NotesModel.fromMap(val);
          if (notesModel.title != "") {
            notesList.add(notesModel);
          }
        }
      }
      return notesList;
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<void> deleteNote(int noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }
}
