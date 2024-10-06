import 'package:NotesApp/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,  this.maxLine=1, this.onSaved, this.onChanged});
    final String hint;
    final int maxLine;
    final void Function(String?)? onSaved;
    final  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved:onSaved ,
      validator:(value){

          if(value?.isEmpty??true){

            return 'Field is required';
          }else {return null;}
      } ,
      cursorColor: kPrimayColor,


      decoration: InputDecoration(
        hintText: hint,
        hintMaxLines: maxLine,
        
        hintStyle: TextStyle(
          color: kPrimayColor
        ),
          

           
        
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimayColor),
      






       



      ),

      
    ) ;
  }
}




 OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
