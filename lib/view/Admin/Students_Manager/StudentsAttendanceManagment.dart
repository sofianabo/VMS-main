import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/AddStudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentsAttendanceManagmentGrid.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudentsAttendencemgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudentsAttendanceManagment extends StatefulWidget {
  const StudentsAttendanceManagment({super.key});

  @override
  State<StudentsAttendanceManagment> createState() =>
      _StudentsAttendanceManagmentState();
}

class _StudentsAttendanceManagmentState
    extends State<StudentsAttendanceManagment> {
  @override
  void initState() {
    Getallgradeapi.Getallgrade();
    IncreaseAttendanceAPI(context).GetIncreaseAttendance(isserch: true);
    super.initState();
  }

  TextEditingController cuse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<Student_attendence_controller>(builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownStudentsAttendencemgmt(
                        isLoading: controller.isGradeLoading,
                        type: "grade",
                        title: "Grade",
                        width: w / 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownStudentsAttendencemgmt(
                        isDisabled: controller.gradeIndex == "" ? true : false,
                        isLoading: controller.isClassLoading,
                        type: "class",
                        title: "Class",
                        width: w / 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownStudentsAttendencemgmt(
                        isLoading: controller.isDivisionLoading,
                        isDisabled: controller.classIndex == "" ? true : false,
                        type: "division",
                        title: "Division",
                        width: w / 5,
                      ),
                    ),
                    SizedBox(
                        width: w / 5.0,
                        child: Obx(() => Row(
                              children: [
                                Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  value: controller.allHolidayChecked.value,
                                  onChanged: (value) {
                                    if (controller.isUploaded == true ||
                                        controller.isLoading == true) {
                                    } else {
                                      if (value == true) {
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                  text: "Done",
                                                  onPressed: () {
                                                    controller.setAllAsHoliday(
                                                        value!, cuse.text);
                                                    Get.back();
                                                  },
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 65)
                                            ],
                                            contents: SizedBox(
                                              width: 500,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Textfildwithupper(
                                                      width: 250,
                                                      controller: cuse,
                                                      Uptext: "Cause",
                                                      hinttext: "Cause")
                                                ],
                                              ),
                                            ),
                                            apptitle:
                                                "Enter The Reason For Absence",
                                            subtitle:
                                                "The reason for the absence of the all students"));
                                      } else {
                                        controller.setAllAsHoliday(
                                            value!, null);
                                      }
                                    }
                                  },
                                ),
                                const Text("Set All As a Holiday"),
                              ],
                            ))),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () async {
                            if (controller.isLoading == false) {
                              if (controller.isUploaded == false) {
                                await Addstudentattendenceapi
                                    .Addstudentattendence(
                                        students: controller.students);
                              }
                            }
                          },
                          icon: Icon(Icons.file_upload_outlined,
                              size: 22,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudentsAttendanceManagmentGrid(),
        )),
      ],
    ));
  }
}
