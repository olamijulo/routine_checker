// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:routine_checker/custom_widgets/routine_container.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_model.dart';
import 'package:routine_checker/modules/routine_module/routine_view_model.dart';

class AddRoutineViewModel extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> frequencyList = [
    {'time': 'hourly', 'isCheck': false},
    {'time': 'daily', 'isCheck': false},
    {'time': 'weekly', 'isCheck': false},
    {'time': 'monthly', 'isCheck': false},
    {'time': 'yearly', 'isCheck': false},
  ];

  toggleCheckbox(index, value) {
    frequencyList.forEach((element) {
      element['isCheck'] = false;
    });
    frequencyList[index]['isCheck'] = value;
    formatDueDate(frequencyList[index]['time']);
    update();
  }

  formatDueDate(frequencySelection) {
    switch (frequencySelection) {
      case 'hourly':
        dueDate = Jiffy().add(hours: 1).yMMMMEEEEdjm;
        frequency = frequencySelection;
        print('1 hour date ${dueDate.toString()}');
        break;
      case 'daily':
        dueDate = Jiffy().add(days: 1).yMMMMEEEEdjm;
        frequency = frequencySelection;
        print('1 day date ${dueDate.toString()}');
        break;
      case 'weekly':
        dueDate = Jiffy().add(weeks: 1).yMMMMEEEEdjm;
        frequency = frequencySelection;
        print('1 week date ${dueDate.toString()}');
        break;
      case 'monthly':
        dueDate = Jiffy().add(months: 1).yMMMMEEEEdjm;
        frequency = frequencySelection;
        print('1 month date ${dueDate.toString()}');
        break;
      case 'yearly':
        dueDate = Jiffy().add(years: 1).yMMMMEEEEdjm;
        frequency = frequencySelection;
        print('1 year date ${dueDate.toString()}');
        break;
      default:
    }
  }

  String? title;
  String? description;
  String? frequency;
  String? createDate;
  String? dueDate;
  String? status = 'Active';

  List<dynamic> routinesData = [];
  addingRoutine() {
    Get.put(RoutineViewModel());
    RoutineViewModel routineViewModel = Get.find();
    routineViewModel.getRoutine();
    var box = Hive.box('routines');

    var addRoutineModel = AddRoutineModel(
        title: title,
        description: description,
        frequency: frequency,
        createDate: Jiffy().yMMMMEEEEdjm,
        dueDate: dueDate,
        status: status);

    var addRoutineModelData = addRoutineModel.toJson();

    box.add(addRoutineModelData);
    log('routing data list ${box.values}');
    routineViewModel.getRoutine();
    routineViewModel.updateStatus();
    update();
  }

  List<dynamic> routinesList = [];

  deleteRoutine(key) {
    var box = Hive.box('routines');

    box.delete(key);
  }
}
