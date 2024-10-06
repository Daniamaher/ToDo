import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
   CustomIcon({super.key, required this.title, required this.icon,this.onPressed});
 final String title;
 final IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(

   height:45,
   width:45,
   decoration:BoxDecoration(
    color: Colors.white.withOpacity(.05),
    borderRadius: BorderRadius.circular(16),
   ),
    child:Center(
    child: IconButton(
    onPressed:onPressed,
    icon:Icon(size:28,
    icon),
    ),

    ),
    );
  }
}