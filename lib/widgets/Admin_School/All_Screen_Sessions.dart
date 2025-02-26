import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetStudyYearStudentAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';

class DropDownAllSessions extends StatelessWidget {
  final double width;
  final String title;
  final String API;
  final String type;
  final Color? color;

  const DropDownAllSessions({
    super.key,
    required this.title,
    required this.API,
    this.color,
    required this.width,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<All_Screen_Sessions_Controller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'session':
          selectedValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;
          break;
      }

      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
        ),
        child: DropdownButton<String>(
          focusColor: Theme.of(context).scaffoldBackgroundColor,
          dropdownColor: Theme.of(context).cardColor,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Theme.of(context).cardColor,
          value: selectedValue,
          isExpanded: true,
          underline: const SizedBox(),
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ],
          ),
          style: Theme.of(context).textTheme.bodyMedium!,
          onChanged: (newValue) async {
            if (newValue != null) {
              cont.selectIndex(type, newValue);
              cont.setsessionid(cont.sessions!.sessions!
                  .firstWhere((session) => session.year == newValue)
                  .id);
              switch (API) {
                case 'AllStudents':
                  Getallstudentapi.Getallstudent(sessionID: cont.sessionId);
                  Get.find<Allstudentscontroller>().resetOnSessionChange();
                  break;
                case 'TeacherManagement':
                  Getallteachersapi.Getallteachers(sessionID: cont.sessionId);
                  Getallclassapi.getAllClasses(sessionID: cont.sessionId);
                  break;
                case 'Teachersts':
                  Getteacherattendenceapi(context)
                      .Getteacherattendence(sessionID: cont.sessionId);
                  Getallclassapi.getAllClasses(sessionID: cont.sessionId);
                  break;
                case 'AllEmployee':
                  cont.selectIndex(type, newValue);
                  cont.setsessionid(cont.sessions!.sessions!
                      .firstWhere((session) => session.year == newValue)
                      .id);
                  Get_All_Employee_API.Get_All_Employee();
                  break;
                case 'class':
                  cont.selectIndex(type, newValue);
                  cont.setsessionid(cont.sessions!.sessions!
                      .firstWhere((session) => session.year == newValue)
                      .id);
                  Get_All_Classes_API(context)
                      .Get_All_Classes(sessionID: cont.sessionId);
                  break;
                case 'division':
                  cont.selectIndex(type, newValue);
                  cont.setsessionid(cont.sessions!.sessions!
                      .firstWhere((session) => session.year == newValue)
                      .id);
                  Get_All_Division_API(context)
                      .Get_All_Division(sessionId: cont.sessionId);
                  break;
                case 'SYStudent':
                  Study_Year_Students_API(context)
                      .Study_Year_Students(sessionId: cont.sessionId);
                  Get.find<StudyYearStudentsController>()
                      .resetOnSessionChange();
                  break;
                case 'StudentState':
                  if (cont.sessions!.sessions!
                          .firstWhere((session) => session.year == newValue)
                          .id ==
                      cont.sessions!.current!.id) {
                    Get.find<StudentAttendencController>()
                        .selectDateindex
                        .value = null;
                    Studentattendenceapi(context).Studentattendence(
                      sessionID: cont.sessionId,
                    );
                    Get.find<StudentAttendencController>()
                        .resetOnSessionChange();
                  } else {
                    if (await Get.find<StudentAttendencController>().selectDate(
                          context: context,
                        ) ==
                        true) {
                      Studentattendenceapi(context).Studentattendence(
                          date: Get.find<StudentAttendencController>()
                              .selectDateindex
                              .value
                              .toString()
                              .replaceAll("00:00:00.000", "")
                              .trim());
                      Get.find<StudentAttendencController>()
                          .resetOnSessionChange();
                    } else {
                      cont.setSessionDefult();
                      return;
                    }
                  }
                  break;

                case 'EmpState':
                  if (cont.sessions!.sessions!
                          .firstWhere((session) => session.year == newValue)
                          .id ==
                      cont.sessions!.current!.id) {
                    Get.find<Employeeattendencecontroller>()
                        .selectDateindex
                        .value = null;
                    Getemployeeattendenceapi(context).Getemployeeattendence();
                  } else {
                    if (await Get.find<Employeeattendencecontroller>()
                            .selectDate(
                          context: context,
                        ) ==
                        true) {
                      Studentattendenceapi(context).Studentattendence(
                          date: Get.find<Employeeattendencecontroller>()
                              .selectDateindex
                              .value
                              .toString()
                              .replaceAll("00:00:00.000", "")
                              .trim());
                    } else {
                      cont.setSessionDefult();
                      return;
                    }
                  }
                  break;
              }
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: title,
              enabled: false,
              child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
            ),
            ..._getDropdownItems(cont, context),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      All_Screen_Sessions_Controller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'session':
        items.addAll(cont.sessionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          );
        }).toList());
        break;
    }

    return items;
  }
}
