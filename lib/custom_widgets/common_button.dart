// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;

  CommonButton({this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: Colors.green[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          child: Text(
            label!,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          )),
    );
  }
}
