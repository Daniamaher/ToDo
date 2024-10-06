import 'dart:ui';

import 'package:NotesApp/constants.dart';
//import 'package:NotesApp/main.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'addnote_event.dart';
part 'addnote_state.dart';

class AddnoteCubit extends Cubit< AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial()) ;
  Color? color=const Color(0xff9C27B0);
   addNote(NoteModel note )async{
    note.color=color!.value;
            emit(AddnoteLoading());
           try { 

  var notesBox = Hive.box<NoteModel>(kNotesBox);
            await notesBox.add(note);
            emit(AddnoteSuccess());
}  catch (e) {
  emit(AddnoteFailure(e.toString()));
}
   }
}
