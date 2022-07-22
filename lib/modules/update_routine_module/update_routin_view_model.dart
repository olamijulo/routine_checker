// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:routine_checker/modules/add_routine_module/add_routine_model.dart';
import 'package:routine_checker/modules/routine_module/routine_screen.dart';
import 'package:routine_checker/modules/routine_module/routine_view_model.dart';

class UpdateRoutineViewModel extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> frequencyList = [
    {'time': 'hourly', 'isCheck': false},
    {'time': 'daily', 'isCheck': false},
    {'time': 'weekly', 'isCheck': false},
    {'time': 'monthly', 'isCheck': false},
    {'time': 'yearly', 'isCheck': false},
  ];

// this method toggles the check box for selecting frequency when adding a routine
  toggleCheckbox(index, value) {
    frequencyList.forEach((element) {
      element['isCheck'] = false;
    });
    frequencyList[index]['isCheck'] = value;
    formatDueDate(frequencyList[index]['time']);
    update();
  }

//this method formats the calculated dueDate based on the current date
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
  String? dueDate;
  updateRoutin() {
    var box = Hive.box('routines');

    Get.put(RoutineViewModel());
    RoutineViewModel routineViewModel = Get.find();

    var addRoutineModel = AddRoutineModel(
        title:
            title ?? box.values.elementAt(routineViewModel.itemIndex)['title'],
        description: description ??
            box.values.elementAt(routineViewModel.itemIndex)['description'],
        frequency: frequency ??
            box.values.elementAt(routineViewModel.itemIndex)['frequency'],
        createDate:
            box.values.elementAt(routineViewModel.itemIndex)['createDate'],
        dueDate: dueDate ??
            box.values.elementAt(routineViewModel.itemIndex)['dueDate'],
        status: box.values.elementAt(routineViewModel.itemIndex)['status']);

    var addRoutineModelData = addRoutineModel.toJson();
    box.put(routineViewModel.itemIndex, addRoutineModelData);
    routineViewModel.getRoutine();
    update();
    Get.to(()=>RoutineScreen());
  }
}
