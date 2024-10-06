import 'package:NotesApp/models/note_model.dart';
import 'package:NotesApp/view/widget/EditNoteViewBody;.dart';
import 'package:flutter/material.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:EditNoteViewBody(
          note:note,
        ),

    );
  }
}