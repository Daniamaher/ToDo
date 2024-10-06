//import 'package:NotesApp/constants.dart';
import 'package:NotesApp/bloc/addnote_cubit.dart';
import 'package:NotesApp/bloc/cubits/cubit/notes_cubit_cubit.dart';
import 'package:NotesApp/view/widget/add_note_form.dart';
//import 'package:NotesApp/view/widget/custom_buttom.dart';
//import 'package:NotesApp/view/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<AddnoteCubit, AddnoteState>(
          listener: (context, state) {
            if (state is AddnoteFailure) {
            }
            if (state is AddnoteSuccess) {
                          BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddnoteLoading?true:false,
              child: Padding(

                padding:  EdgeInsets.only(left:16,right:16,
                                bottom:MediaQuery.of(context).viewInsets.bottom,),
                child: SingleChildScrollView(child: AddNoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
