// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:routine_checker/custom_widgets/routine_container.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_model.dart';
import 'package:routine_checker/modules/routine_module/single_routine_screen.dart';

class RoutineViewModel extends GetxController {
  int valueLength = 0;
  var valueItem;
  int itemIndex = 0;

  getRoutine() {
    var box = Hive.box('routines');
    valueLength = box.keys.length;
    log('routing list ${box.values}');
    update();
  }

  String title = '';
  String description = '';
  String dueDate = '';
  String createdDate = '';
  String status = '';

  displayRoutins(index) {
    var box = Hive.box('routines');
    valueItem = box.values.elementAt(index);
    return RoutineContainer(
      title: valueItem['title'] ?? '',
      dueDate: valueItem['dueDate'] ?? '',
      status: valueItem['status'] ?? '',
      statusColor: statusColor(valueItem['status']),
      onTap: () {
        print(index);
        itemIndex = index;
        title = box.values.elementAt(index)['title'];
        description = box.values.elementAt(index)['description'];
        createdDate = box.values.elementAt(index)['createDate'];
        dueDate = box.values.elementAt(index)['dueDate'];
        status = box.values.elementAt(index)['status'];
        Get.to(() => SingleRoutineScreen());
      },
    );
  }

  statusColor(status) {
    switch (status) {
      case 'Expired':
        return Colors.red[900];
      case 'Done':
        return Colors.green[900];
      case 'Missed':
        return Colors.red[400];
      case 'Active':
        return Colors.blue;
      default:
    }
  }

  bool statusUpdate =
      false; // this variable stores the value of the checkbox in the single_routine_screen

  //this methos toggles the value of the checkbox in the single routin screen
  statusCheckBoxToggle(value) {
    var box = Hive.box('routines');

    statusUpdate = value;
    if (statusUpdate == true) {
      var addRoutineModel = AddRoutineModel(
          title: box.values.elementAt(itemIndex)['title'],
          description: box.values.elementAt(itemIndex)['description'],
          frequency: box.values.elementAt(itemIndex)['frequency'],
          createDate: box.values.elementAt(itemIndex)['createDate'],
          dueDate: box.values.elementAt(itemIndex)['dueDate'],
          status: 'Done');

      var addRoutineModelData = addRoutineModel.toJson();
      box.put(itemIndex, addRoutineModelData);
      statusUpdate = false;
      update();
      Get.back();
    }
  }

//this method updates the status of all items to expired in 15 minutes
  updateStatus() {
    Timer(Duration(seconds: 3), () {
      var box = Hive.box('routines');

      for (int i = 0; i < box.keys.length; i++) {
        var addRoutineModel = AddRoutineModel(
            title: box.values.elementAt(i)['title'],
            description: box.values.elementAt(i)['description'],
            frequency: box.values.elementAt(i)['frequency'],
            createDate: box.values.elementAt(i)['createDate'],
            dueDate: box.values.elementAt(i)['dueDate'],
            status: 'Expired');

        var addRoutineModelData = addRoutineModel.toJson();
        box.put(i, addRoutineModelData);
      }
      log('routing list ${box.values}');
      print('successful');
      update();
    });
  }
}
