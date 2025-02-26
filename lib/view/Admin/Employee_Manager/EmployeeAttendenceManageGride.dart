import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class EmployeesAttendanceManagmentGrid extends StatefulWidget {
  const EmployeesAttendanceManagmentGrid({super.key});

  @override
  State<EmployeesAttendanceManagmentGrid> createState() =>
      _EmployeesAttendanceManagmentGridState();
}

class _EmployeesAttendanceManagmentGridState
    extends State<EmployeesAttendanceManagmentGrid> {
  TextEditingController cuse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeController>(builder: (controller) {
      return controller.Isloading == false
          ? controller.Isuploaded == true
              ? Center(
                  child: Text("Attendance Today Has Been Uploaded",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16, fontWeight: FontWeight.normal)))
              : Obx(() {
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40),
                            child: ListView.builder(
                              itemCount: controller.Employees.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 3.5,
                                          child: Row(
                                            children: [
                                              FutureBuilder(
                                                future: precacheImage(
                                                    NetworkImage(
                                                        "$getimage${controller.Employees[index]["imgid"]}"),
                                                    context),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return CircleAvatar(
                                                      maxRadius: 25,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      backgroundImage:
                                                          controller.Employees[
                                                                          index]
                                                                      [
                                                                      "imgid"] !=
                                                                  null
                                                              ? NetworkImage(
                                                                  "$getimage${controller.Employees[index]["imgid"]}")
                                                              : null,
                                                      child:
                                                          controller.Employees[
                                                                          index]
                                                                      [
                                                                      "imgid"] ==
                                                                  null
                                                              ? Text(
                                                                  "${controller.Employees[index]['name']!.substring(0, 1).toUpperCase()}",
                                                                  style: Get
                                                                      .textTheme
                                                                      .titleLarge!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              26,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                )
                                                              : null,
                                                    );
                                                  } else {
                                                    return CircleAvatar(
                                                      maxRadius: 25,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      child:
                                                          LoadingAnimationWidget
                                                              .inkDrop(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 15,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                    "${controller.Employees[index]['name']}"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ...[
                                          'Present',
                                          'Truant',
                                          'Late',
                                          'Vacation',
                                          'Holiday'
                                        ]
                                            .map((status) => Row(
                                                  children: [
                                                    Radio(
                                                      value: status,
                                                      groupValue: controller
                                                              .Employees[index]
                                                          ['status'],
                                                      activeColor:
                                                          const Color(0xff134B70),
                                                      onChanged: (value) {
                                                        if (value ==
                                                            "Holiday") {
                                                        } else {
                                                          if (value ==
                                                                  "Truant" ||
                                                              value == "Late" ||
                                                              value ==
                                                                  "Vacation") {
                                                            Get.dialog(
                                                                VMSAlertDialog(
                                                                    action: [
                                                                  ButtonDialog(
                                                                      text:
                                                                          "Done",
                                                                      onPressed:
                                                                          () {
                                                                        controller.updateStatus(
                                                                            index,
                                                                            value.toString(),
                                                                            cuse.text);
                                                                        Get.back();
                                                                      },
                                                                      color: Get
                                                                          .theme
                                                                          .primaryColor,
                                                                      width: 65)
                                                                ],
                                                                    contents:
                                                                        SizedBox(
                                                                      width:
                                                                          500,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
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
                                                                        "The reason for the absence of the student ${controller.Employees[index]['name']}"));
                                                          } else {
                                                            controller.updateStatus(
                                                                index,
                                                                value
                                                                    .toString(),
                                                                null);
                                                          }
                                                        }
                                                      },
                                                    ),
                                                    Text(
                                                      status,
                                                      style: TextStyle(
                                                        color: status ==
                                                                'Present'
                                                            ? const Color(0xff2F9742)
                                                            : status == 'Truant'
                                                                ? const Color(
                                                                    0xff972F2F)
                                                                : status ==
                                                                        'Late'
                                                                    ? const Color(
                                                                        0xff349393)
                                                                    : status ==
                                                                            'Vacation'
                                                                        ? const Color(
                                                                            0xffB27671)
                                                                        : const Color(
                                                                            0xff134B70),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                            ,
                                      ],
                                    ),
                                    Divider(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                );
                              },
                            )),
                      ),
                    ],
                  );
                })
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Get.width / 3.5,
                                  child: Row(
                                    children: [
                                      SchemaWidget(
                                        width: 50,
                                        height: 50,
                                        radius: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child:
                                            SchemaWidget(width: 70, height: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                ...[
                                  'Present',
                                  'Truant',
                                  'Late',
                                  'Vacation',
                                  'Holiday'
                                ]
                                    .map((status) => Row(
                                          children: [
                                            SchemaWidget(
                                              width: 15,
                                              height: 15,
                                              radius: 50,
                                            ),
                                            SchemaWidget(width: 50, height: 15),
                                          ],
                                        ))
                                    ,
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
