import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Allteacheratendencecontroller extends GetxController {
  late BuildContext context;
  List<Teacherattendance> teacher = [];
  List<Teacherattendance>? filteredTeacher;
  String filteredName = "";
  String classIndex = "";
  String SubjectIndex = "";
  String TypeIndex = "";
  bool isLoading = true;
  List<String> classlist = [];
  List<String> Subjectlist = [];
  List<String> Typelist = ['Present', 'Truant', 'Late', 'Vacation', 'Holiday'];
  bool isSubjectLoading = true;
  bool isClassLoading = true;
  bool isCurriculumLoading = true;


  SetSubject(List<String> subjects){
    Subjectlist = subjects;
    setSubjectLoading(false);
    update();
  }
  SetClass(List<String> classes){
    classlist = classes;
    setClassLoading(false);
    update();
  }


  setSubjectLoading(bool value){
    isSubjectLoading = value;
    update();
  }
  setClassLoading(bool value){
    isClassLoading = value;
    classIndex = "";
    update();
  }


  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Class':
        classIndex = index ?? "";
        break;
      case 'Subject':
        SubjectIndex = index ?? "";
        break;
        case 'Type':
          TypeIndex = index ?? "";
        break;
    }
    searchRequestByName(filteredName,classIndex,SubjectIndex,TypeIndex);
    update();
  }

  void setAllteachers(AllTeacherAttendenceModel model) {
    teacher = model.teacherattendance!;
    searchRequestByName(filteredName , classIndex , SubjectIndex,TypeIndex);
    setIsLoading(false);
    update();
  }



  void searchRequestByName(String query, String classes, String subjects,String type) {
    List<Teacherattendance> tempFilteredList = List.from(teacher ?? []);

    if (query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        final empName = teacher.fullName?.toLowerCase() ?? '';
        final email = teacher.email?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase()) ||   email.contains(query.toLowerCase());
      }).toList();
    }

    if (classes.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        return teacher.classes?.any((cls) =>
        cls.name?.toLowerCase() == classes.toLowerCase() ||
            cls.enName?.toLowerCase() == classes.toLowerCase()) ?? false;
      }).toList();
    }

    if (subjects.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        return teacher.subject?.any((subj) =>
        subj.name?.toLowerCase() == subjects.toLowerCase() ||
            subj.enName?.toLowerCase() == subjects.toLowerCase()) ?? false;
      }).toList();
    }
    if (type.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.status! == type ;
      }).toList();
    }

    filteredName = query;
    filteredTeacher = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchRequestByName("" , classIndex , SubjectIndex,TypeIndex);
    update();
  }


  void updateList(
      String type,
      List<String> options,
      ) {
    switch (type) {
      case 'Class':
        classlist = options;
        break;
        case 'Type':
          Typelist = options;
        break;
      case 'Subject':
        Subjectlist = options;
        break;
    }
    update();
  }



  setIsLoading(bool value) {
    isLoading = value;
    update();
  }



  Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);

  removeAttendence(){
    AttendencetDate.value = null;
    update();
  }



  void selectDate(BuildContext context) async {

    try {
      String rawStartDate = Get.find<All_Screen_Sessions_Controller>().startSessionDate;
      String rawEndDate = Get.find<All_Screen_Sessions_Controller>().endSessionDate;


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
        Getteacherattendenceapi(context).Getteacherattendence(
          date: picked.toString(),
          sessionID: Get.find<All_Screen_Sessions_Controller>().sessionId,
        );
      }
    } catch (e) {
      print("Error parsing date: $e");
    }
  }





  String get selectedclassIndex => classIndex;
  String get selectedSubjectIndex => SubjectIndex;
  String get selectedTypeIndex => TypeIndex;
  Rx<DateTime?> get selectDateindex => AttendencetDate;
}
