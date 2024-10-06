/*import 'package:NotesApp/bloc/cubits/cubit/notes_cubit_cubit.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:NotesApp/view/widget/noteitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        
           List<NoteModel>notes=BlocProvider.of<NotesCubitCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(

            itemCount: notes.length, 
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
                             

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
*/


import 'package:NotesApp/bloc/cubits/cubit/notes_cubit_cubit.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:NotesApp/view/widget/noteitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubitCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}