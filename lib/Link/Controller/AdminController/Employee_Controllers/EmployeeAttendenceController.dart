import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllEmployeeAttendeceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Employeeattendencecontroller extends GetxController {
  late BuildContext context;
  List<Attendance> employee = [];
  List<Attendance> filteredreemployees = [];
  String JopTitleIndex = "";
  bool isLoading = true;
  List<String> JobTitleList = [
    "Manager",
    "Dustman",
    "Guard",
    "Registration",
    "Secretariat",
    "Secretary",
    "Supervisor",
    "Accountant",
    "Technical Support",
    "Media",
    "Technical Support Manager",
  ];
  String filteredName = "";
  void setEmployee(AllEmployeeAttendeceModel model) {
    employee = model.attendance!;
    filteredreemployees = List.from(employee);
    setIsLoading(false);
    update();
  }

  void clearFilter() {
    searchRequestByName("", JopTitleIndex);
    update();
  }

  removeAttendence() {
    AttendencetDate.value = null;
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    update();
  }

  void searchRequestByName(String query, String jopindex) {
    List<Attendance> tempFilteredList = List.from(employee);

    if (query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        final empName = emp.fullName?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase());
      }).toList();
    }

    if (jopindex.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.jobTitle?.toLowerCase() == jopindex.toLowerCase();
      }).toList();
    }

    filteredName = query;
    filteredreemployees = tempFilteredList;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'jobTitle':
        JopTitleIndex = index ?? "";
        break;
    }
    searchRequestByName(filteredName, JopTitleIndex);
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'jobTitle':
        JobTitleList = options;
        break;
    }
    update();
  }

  void setAllEmployee(AllEmployeeAttendeceModel model) {
    employee = model.attendance!;
    setIsLoading(false);
    searchRequestByName(filteredName, JopTitleIndex);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);

  Future<bool> selectDate({required BuildContext context}) async {
    String rawStartDate =
        Get.find<All_Screen_Sessions_Controller>().startSessionDate;
    String rawEndDate =
        Get.find<All_Screen_Sessions_Controller>().endSessionDate;

    print("Raw Start Date: $rawStartDate");
    print("Raw End Date: $rawEndDate");

    rawStartDate = rawStartDate.trim();
    rawEndDate = rawEndDate.trim();

    DateFormat format = DateFormat("yyyy-MM-dd");

    DateTime startDate = format.parse(rawStartDate);
    DateTime endDate = format.parse(rawEndDate);

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: startDate,
      lastDate: endDate,
    );

    if (picked != null) {
      AttendencetDate.value = picked;
      Getemployeeattendenceapi(context).Getemployeeattendence(
        date: picked.toString(),
      );
      return true;
    } else {
      return false;
    }
  }

  String get selectejobTitleIndex => JopTitleIndex;
  Rx<DateTime?> get selectDateindex => AttendencetDate;
}
