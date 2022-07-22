// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_checker/custom_widgets/common_button.dart';
import 'package:routine_checker/modules/routine_module/routine_view_model.dart';
import 'package:routine_checker/modules/update_routine_module/update_routine_screen.dart';

class SingleRoutineScreen extends StatelessWidget {
  SingleRoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child: GetBuilder<RoutineViewModel>(
              init: RoutineViewModel(),
              builder: (routineViewModel) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        routineViewModel.title,
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 200.0,
                        child: Divider(
                          thickness: 3.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        routineViewModel.description,
                        style: TextStyle(fontSize: 13.0),
                      ),
                      SizedBox(
                        width: 250.0,
                        child: Divider(
                          thickness: 3.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Created Date: ',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            routineViewModel.createdDate,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Due Date: ',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            routineViewModel.dueDate,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  routineViewModel.status,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    value: routineViewModel.statusUpdate,
                                    onChanged: (value) {
                                      routineViewModel
                                          .statusCheckBoxToggle(value);
                                    }),
                                Text(
                                  'Mark as Done',
                                  style: TextStyle(fontSize: 12.0),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      CommonButton(
                          onPressed: () {
                            Get.to(() => UpdateRoutineScreen());
                          },
                          label: 'Add Routine')
                    ],
                  ),
                );
              })),
    );
  }
}
