import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/view/Admin/SideBar_Path.dart';
import '../../widgets/SidbarAnimation.dart';

class SideBarAdmin extends StatelessWidget {
  SideBarAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
            painter: MyPainter(),
            child: SizedBox(width: 90, height: h > 635 ? h / 1.2 : h / 1.25)),
        GetBuilder<AdminHomeContentController>(builder: (cont) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SidbarAnimation(
                  child: GestureDetector(
                onTap: () {
                  cont.updateContent("Dashboard");
                },
                child: Icon(
                  VMS_Icons.a1,
                  size: 18,
                  color: Colors.white,
                ),
              )),
              SidbarAnimation(
                  child: Padding(
                padding: EdgeInsets.only(top: h / 34.2),
                child: GestureDetector(
                  onTap: () {
                    cont.updateContent("Enroll Requests");
                  },
                  child: const Icon(
                    VMS_Icons.a2,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a3,
                      color: Colors.white,
                      size: 18,
                    ),
                    onSelected: (value) {
                      if (value == "Exam Table".tr) {
                        cont.updateContent("Exam Table");
                      }
                      if (value == "School Time Table".tr) {
                        cont.updateContent("School Time Table");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Exam Table'.tr,
                        child: Text(
                          'Exam Table'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'School Time Table'.tr,
                        child: Text(
                          'School Time Table'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a4,
                      color: Colors.white,
                      size: 18,
                    ),
                    onSelected: (value) {
                      if (value == "All Students".tr) {
                        cont.updateContent("All Students");
                      }
                      if (value == "Study Year Students".tr) {
                        cont.updateContent("Study Year Students");
                      }
                      if (value == "All Guardians".tr) {
                        cont.updateContent("All Guardians");
                      }
                      if (value == "Student Attendance".tr) {
                        cont.updateContent("Student Attendance");
                      }
                      if (value == "Students Attendance Managment".tr) {
                        cont.updateContent("Students Attendance Managment");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'All Students'.tr,
                        child: Text(
                          'All Students'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Study Year Students'.tr,
                        child: Text(
                          'Study Year Students'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'All Guardians'.tr,
                        child: Text(
                          'All Guardians'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Student Attendance'.tr,
                        child: Text(
                          'Student Attendance'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Students Attendance Managment'.tr,
                        child: Text(
                          'Students Attendance Managment'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a5,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "Teacher Management".tr) {
                        cont.updateContent("Teacher Management");
                      }
                      if (value == "Teacher Status".tr) {
                        cont.updateContent("Teacher Status");
                      }
                      if (value == "Teacher Attendance Managment".tr) {
                        cont.updateContent("Teacher Attendance Managment");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Teacher Management'.tr,
                        child: Text(
                          'Teacher Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Status'.tr,
                        child: Text(
                          'Teacher Status'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Attendance Managment'.tr,
                        child: Text(
                          'Teacher Attendance Managment'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a6,
                      color: Colors.white,
                      size: 20,
                    ),
                    onSelected: (value) {
                      if (value == "Employee Management".tr) {
                        cont.updateContent("Employee Management");
                      }
                      if (value == "Employee Attendance".tr) {
                        cont.updateContent("Employee Attendance");
                      }
                      if (value == "Employee Attendance Manage".tr) {
                        cont.updateContent("Employee Attendance Manage");
                      }
                      if (value == "Virtual User Management".tr) {
                        cont.updateContent("Virtual User Management");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Employee Management'.tr,
                        child: Text(
                          'Employee Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Employee Attendance'.tr,
                        child: Text(
                          'Employee Attendance'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Employee Attendance Manage'.tr,
                        child: Text(
                          'Employee Attendance Manage'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Virtual User Management'.tr,
                        child: Text(
                          'Virtual User Management'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a7,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "Session Management".tr) {
                        cont.updateContent("Session Management");
                      }
                      if (value == "Grade Management".tr) {
                        cont.updateContent("Grade Management");
                      }
                      if (value == "Subject Management".tr) {
                        cont.updateContent("Subject Management");
                      }
                      if (value == "Class Management".tr) {
                        cont.updateContent("Class Management");
                      }
                      if (value == "Division Management".tr) {
                        cont.updateContent("Division Management");
                      }
                      if (value == "Curriculum Management".tr) {
                        cont.updateContent("Curriculum Management");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Session Management'.tr,
                        child: Text(
                          'Session Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Grade Management'.tr,
                        child: Text(
                          'Grade Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Class Management'.tr,
                        child: Text(
                          'Class Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Division Management'.tr,
                        child: Text(
                          'Division Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Subject Management'.tr,
                        child: Text(
                          'Subject Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Curriculum Management'.tr,
                        child: Text(
                          'Curriculum Management'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "".tr,
                    child: const Icon(
                      VMS_Icons.a8,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "School Data Management".tr) {
                        cont.updateContent("School Data Management");
                      }
                      if (value == "Electronic Library".tr) {
                        cont.updateContent("Electronic Library");
                      }
                      if (value == "Transaction".tr) {
                        cont.updateContent("Transaction");
                      }
                      if (value == "Illness Screen".tr) {
                        cont.updateContent("Illness Screen");
                      }
                      if (value == "Vaccine Screen".tr) {
                        cont.updateContent("Vaccine Screen");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'School Data Management'.tr,
                        child: Text(
                          'School Data Management'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Electronic Library'.tr,
                        child: Text(
                          'Electronic Library'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Transaction'.tr,
                        child: Text(
                          'Transaction'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Illness Screen'.tr,
                        child: Text(
                          'Illness Screen'.tr,
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Vaccine Screen'.tr,
                        child: Text(
                          'Vaccine Screen'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
