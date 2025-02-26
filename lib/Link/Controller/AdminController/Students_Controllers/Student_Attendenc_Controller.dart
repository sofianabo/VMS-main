import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentAttendenceModel.dart';

class StudentAttendencController extends GetxController {
  List<Attendance> stud = [];
  List<Attendance> filteredStudents = [];
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";
  bool isLoading = true;

  String? filterName = '';
  String? filterGrade = '';
  String? filterClass = '';
  String? filterDivision = '';

  List<String> gradelist = [];
  bool isGradeLoading = true;
  List<String> classlist = [];
  bool isClassLoading = true;
  List<String> divisionlist = [];
  bool isDivisionLoading = true;
  List<String> sessionlist = [];

  void clearFilter() {
    searchByName("", gradeIndex, classIndex, divisionIndex);
    update();
  }

  removeAttendence() {
    AttendencetDate.value = null;
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    update();
  }

  void searchByName(
      String? nameQuery, String? grade, String? classs, String? division) {
    List<Attendance> tempFilteredList = List.from(stud);
    filterName = nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final name = cur.fullName?.toLowerCase() ?? '';
        return name.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (grade != null && grade.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.grade!.enName == grade || cur.grade!.enName == grade;
      }).toList();
    }

    if (classs != null && classs.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.classes!.enName == classs || cur.classes!.name == classs;
      }).toList();
    }
    if (division != null && division.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.division!.enName == division ||
            cur.division!.name == division;
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }

  setGradeList(List<String> value) {
    gradeIndex = "";
    gradelist.clear();
    gradelist = value;
    setGradeLoading(false);
    update();
  }

  setClassList(List<String> value) {
    classIndex = "";
    classlist.clear();
    classlist = value;
    setClassLoading(false);
    update();
  }

  setDivisionList(List<String> value) {
    setDivisionLoading(false);
    divisionlist.clear();
    divisionIndex = "";
    divisionlist = value;
    update();
  }

  setGradeLoading(bool value) {
    isGradeLoading = value;
    update();
  }

  setClassLoading(bool value) {
    isClassLoading = value;
    classIndex = "";
    update();
  }

  setDivisionLoading(bool value) {
    isDivisionLoading = value;
    update();
  }

  resetOnSessionChange() {
    gradeIndex = "";
    classIndex = "";
    divisionIndex = "";
    update();
  }

  resetOnGradeChange() {
    classIndex = "";
    divisionIndex = "";
    print("lkdssdf");
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";

        break;
      case 'division':
        divisionIndex = index ?? "";

        break;
    }

    searchByName(filterName, gradeIndex, classIndex, divisionIndex);

    update();
  }

  void setAllStudents(AllStudentAttendenceModel model) {
    stud = model.attendance!;
    filteredStudents = List.from(stud);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(
          filterName.toString(), gradeIndex, classIndex, divisionIndex);
    }

    if (gradeIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.grade!.name == gradeIndex || emp.grade!.enName == gradeIndex;
      }).toList();
    }
    if (classIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.classes!.enName == classIndex ||
            emp.classes!.name == classIndex;
      }).toList();
    }
    if (divisionIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.division!.enName == divisionIndex ||
            emp.division!.name == divisionIndex;
      }).toList();
    }

    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
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
      Studentattendenceapi(context).Studentattendence(
        date: picked.toString(),
      );
      return true;
    } else {
      return false;
    }
  }

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  Rx<DateTime?> get selectDateindex => AttendencetDate;
}
