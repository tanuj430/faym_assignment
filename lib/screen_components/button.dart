import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key,required this.  text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * .08,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black
        ),
      child: Text(
        "$text",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: Colors.white
        ),
      ),
    );
  }
}
