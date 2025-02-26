import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Transaction_API.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Transaction_Model.dart';

class Transaction_Controller extends GetxController {
  bool isLoading = true;
  List<Transaction>? transaction;
  String rollIndex = "";
  List<String> rolllist = [
    'Admin',
    'SubAdmin',
    'Supervisor',
    'Registration',
    'Accountant',
    'Teacher',
    'Guardian',
    'Student',
    'Class',
    'Observer'
  ];
  String rowsIndex = "25";
  List<String> rowslist = [
    '25',
    '50',
    '75',
    '100',
    '150',
    '200',
    'Up 200',
  ];
  String actionIndex = "";
  List<String> actionlist = [];

  List<Transaction>? filteredTransaction;
  String filteredName = "";

  void searchRequestByName(
      String query, String roll, String Date, String action) {
    List<Transaction> tempFilteredList = List.from(transaction ?? []);

    if (query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        final empName = teacher.userName?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase());
      }).toList();
    }

    if (roll.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.roll!.toLowerCase() == rollIndex.toLowerCase();
      }).toList();
    }
    if (action.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.action!.toLowerCase() == actionIndex.toLowerCase();
      }).toList();
    }

    if (Date.toString() != "null") {
      print(Date);
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.date!.contains(Date.replaceAll(" 00:00:00.000", ""));
      }).toList();
    }

    filteredName = query;
    filteredTransaction = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchRequestByName(
        "", rollIndex, AttendencetDate.value.toString(), actionIndex);
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'roll':
        rollIndex = index ?? "";
        break;
      case 'action':
        actionIndex = index ?? "";
        break;
      case 'rows':
        rowsIndex = index ?? "";
        break;
    }
    searchRequestByName(
        filteredName, rollIndex, AttendencetDate.value.toString(), actionIndex);
    if (type == "rows") {
      Get_Transaction_Screen_API.Get_Transaction_Screen(rows: index);
    }
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'roll':
        rolllist = options;
        break;
      case 'action':
        actionlist = options;
        break;
      case 'rows':
        rowslist = options;
        break;
    }
    update();
  }

  Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);

  Future<bool> selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      AttendencetDate.value = picked;
      searchRequestByName(
          filteredName, rollIndex, picked.toString(), actionIndex);
      return true;
    } else {
      return false;
    }
  }

  void setData(Transaction_Model tran) {
    transaction = tran.transaction;
    setIsLoading(false);

    searchRequestByName(
      filteredName,
      rollIndex,
      AttendencetDate.value.toString(),
      actionIndex,
    );

    actionlist = tran.transaction!.map((t) => t.action!).toSet().toList();
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  String get selectedrollIndex => rollIndex;
  String get selectedactionIndex => actionIndex;
  String get selectedrowsIndex => rowsIndex;
  Rx<DateTime?> get selectDateindex => AttendencetDate;

  void removeAttendence() {
    AttendencetDate.value = null;
    searchRequestByName(filteredName, rollIndex, "", actionIndex);
    update();
  }
}
