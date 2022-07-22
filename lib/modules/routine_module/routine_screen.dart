// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_checker/custom_widgets/common_button.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_screen.dart';
import 'package:routine_checker/modules/routine_module/routine_view_model.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(RoutineViewModel());
    RoutineViewModel routineViewModel = Get.find();
    routineViewModel.getRoutine();
    routineViewModel.updateStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: Text(
            'Routines',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: GetBuilder<RoutineViewModel>(
              init: RoutineViewModel(),
              builder: (routineViewModel) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: routineViewModel.valueLength,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5.0);
                        },
                        itemBuilder: (context, index) {
                          return routineViewModel.displayRoutins(index);
                        },
                      ),
                    ),
                    CommonButton(
                      label: 'Add New Routine',
                      onPressed: () {
                        routineViewModel.getRoutine();
                        Get.to(() => AddRoutineScreen());
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
  