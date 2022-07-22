// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_checker/custom_widgets/custom_card.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_view_model.dart';
import 'package:routine_checker/modules/routine_module/routine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Home',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomCard(
                  onTap: () => Get.to(() => RoutineScreen()),
                  iconUrl: 'assets/images/schedule.png',
                  title: 'Scheduled',
                )),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                    child: CustomCard(
                  // onTap: AddRoutineViewModel().getRoutine(),
                  iconUrl: 'assets/images/right-chevron.png',
                  title: 'Next Up',
                )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
