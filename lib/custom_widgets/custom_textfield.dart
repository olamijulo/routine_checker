// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final Function(String)? onChanged;
  final String Function(String?)? validator;
  CustomTextField({this.maxLines, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black54,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
          fontSize: 13.0, color: Colors.black54, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 15.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    );
  }
}
