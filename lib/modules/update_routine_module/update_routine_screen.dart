// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_checker/custom_widgets/common_button.dart';
import 'package:routine_checker/custom_widgets/custom_textfield.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_view_model.dart';
import 'package:routine_checker/modules/routine_module/routine_view_model.dart';
import 'package:routine_checker/modules/update_routine_module/update_routin_view_model.dart';

class UpdateRoutineScreen extends StatefulWidget {
  const UpdateRoutineScreen({Key? key}) : super(key: key);

  @override
  State<UpdateRoutineScreen> createState() => _UpdateRoutineScreenState();
}

class _UpdateRoutineScreenState extends State<UpdateRoutineScreen> {
  

  @override
  Widget build(BuildContext context) {

    Get.put(RoutineViewModel());
    RoutineViewModel routineViewModel = Get.find();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: Text(
            'Create Schedule',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          )),
      body: SafeArea(
        child: GetBuilder<UpdateRoutineViewModel>(
            init: UpdateRoutineViewModel(),
            builder: (updateRoutineViewModel) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Form(
                    key: updateRoutineViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title:',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(
                          onChanged: (value) {
                            updateRoutineViewModel.title = value;
                          },
                          initialValue: routineViewModel.title,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'field cannot be left blank';
                            }
                            return '';
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Description:',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(
                          maxLines: 4,
                          initialValue: routineViewModel.description,
                          onChanged: (value) {
                            updateRoutineViewModel.description = value;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Frequency:',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 250.0,
                          child: ListView.builder(
                              itemCount:
                                  updateRoutineViewModel.frequencyList.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                    dense: true,
                                    activeColor: Colors.green,
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    value: updateRoutineViewModel
                                        .frequencyList[index]['isCheck'],
                                    title: Text(updateRoutineViewModel
                                        .frequencyList[index]['time']),
                                    onChanged: (value) {
                                      updateRoutineViewModel.toggleCheckbox(
                                          index, value);
                                    });
                              }),
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        CommonButton(
                            onPressed: () {
                              updateRoutineViewModel.updateRoutin();
                            },
                            label: 'Update Routine')
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
