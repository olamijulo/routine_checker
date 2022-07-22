// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? iconUrl;
  final String? title;
  final VoidCallback? onTap;

  CustomCard({this.iconUrl, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 200.0,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconUrl!,
                  height: 80.0,
                  width: 80.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  title!,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
