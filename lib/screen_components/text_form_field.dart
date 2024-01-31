import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String label;
  final bool obsecureText;
  final icon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.obsecureText,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration:InputDecoration(
        focusColor: Colors.white,
        hintText: hintText,
        labelText: label,
        fillColor: Colors.white70,
        filled: true,
        prefixIcon: icon,
        labelStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500

        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value==null || value!.isEmpty) {
          return 'Please enter ${label}';
        }
        if ( label == "Password" && value!.length<5) {
          return 'Password is less than 5 characters';
        }
        if (label== 'Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
          return 'Please enter a valid e-mail';
        }
        if(label=='Mobile Number' && value!.length < 10 || value!.length > 13){
          return 'please enter the valid Mobile Number';
        }

        return null;
      },
    );
  }
}
