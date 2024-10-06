import 'package:NotesApp/bloc/cubits/cubit/notes_cubit_cubit.dart';
import 'package:NotesApp/constants.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:NotesApp/view/widget/colors_list_views.dart';
import 'package:NotesApp/view/widget/custom_textfield.dart';
import 'package:NotesApp/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
 final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
String ? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Column(
        children: [
          SizedBox(height:50),
          CustomAppBar(
            onPressed:(){
              widget.note.title=title??widget.note.title;
             widget.note.subTitle=content??widget.note.subTitle;
             widget.note.save();
             BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
             Navigator.pop(context);

            } ,
            title:'Edit Note',
            icon: Icons.check,
          ),
                    SizedBox(height:50),

          CustomTextField(
            onChanged: (value){title=value;},
            hint: widget.note.title),
                    const SizedBox(height:16),

         CustomTextField( onChanged: (value){content=value;},

          hint:widget.note.subTitle,maxLine: 5,),
               SizedBox(height:16),

              EditNotesColorsList(

              note:widget.note
             )
        ],
      ),
    );
  }
}




class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int currentIndex;
  @override
  void initState(){
    currentIndex=kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color =kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  IsActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
 