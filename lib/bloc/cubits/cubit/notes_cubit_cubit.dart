import 'package:NotesApp/constants.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<NoteModel> ? notes;
  fetchAllNotes() async {
    //emit(NotesCubitLoading());
    
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes=notesBox.values.toList();
     emit(NotesCubitSuccess());
    
  }
}
