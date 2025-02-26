import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Employee_Attendence.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/IncreaseEmployeAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeAttendenceManageGride.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class EmployeeAttendanceManagment extends StatefulWidget {
  const EmployeeAttendanceManagment({super.key});

  @override
  State<EmployeeAttendanceManagment> createState() =>
      _EmployeeAttendanceManagmentState();
}

class _EmployeeAttendanceManagmentState
    extends State<EmployeeAttendanceManagment> {
  @override
  void initState() {
    super.initState();
    Increaseemployeattendenceapi.Increaseemployeattendence();
  }

  TextEditingController cuse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<EmployeeController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                                    if (controller.Isuploaded == true ||
                                        controller.Isloading == true) {
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
                            if (controller.Isloading == false) {
                              if (controller.Isuploaded == false) {
                                await Add_Employee_Attendence_API
                                    .Add_Employee_Attendence(
                                        employees: controller.Employees);
                                print(controller.Employees);
                              }
                            }
                          },
                          icon: Icon(Icons.file_upload_outlined,
                              size: 22,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: EmployeesAttendanceManagmentGrid(),
        )),
      ],
    ));
  }
}
