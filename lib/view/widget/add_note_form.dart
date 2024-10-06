import 'package:NotesApp/bloc/addnote_cubit.dart';
import 'package:NotesApp/models/note_model.dart';
import 'package:NotesApp/view/widget/colors_list_views.dart';
import 'package:NotesApp/view/widget/custom_buttom.dart';
import 'package:NotesApp/view/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLine: 5,
          ),
             const SizedBox(
            height: 32,
          ),
          ColorsListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              isLoading:
              state is AddnoteLoading ? true : false;

              return CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var CurrentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat.yMd().format(CurrentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddnoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
