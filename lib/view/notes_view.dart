import 'package:NotesApp/view/widget/addnotebuttomsheet.dart';
import 'package:flutter/material.dart';
import 'package:NotesApp/view/widget/noteviewbody.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return AddNoteBottomSheet();
                });
          },
          child: Icon(Icons.add)),
      body: NotesViewBody(),
    );
  }
}
