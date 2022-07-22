// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class RoutineContainer extends StatelessWidget {
  final String? title;
  final String? dueDate;
  final String? status;
  final Color statusColor;
  final VoidCallback? onTap;

  RoutineContainer({
    this.title,
    this.dueDate,
    this.status,
    this.onTap,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration:
            BoxDecoration(border: Border(left: BorderSide(color: statusColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  'Due date: ',
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
                Text(
                  dueDate!,
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
                Text(
                  status!,
                  style: TextStyle(fontSize: 12.0, color: statusColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
