import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Delete_Session_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Edit_Session_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper_Num.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class SessionManagementGrid extends StatelessWidget {
  const SessionManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionController>(builder: (control) {
      return control.isLoading == false
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1),
              itemCount: control.Sessionss.length,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (control.Sessionss[index]['status'] != "Closed") {
                            Get.dialog(VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Yes Close",
                                      onPressed: () {
                                        control.updateStatus(index, "Closed");
                                        Get.back();
                                      },
                                      color: const Color(0xff134B70),
                                      width: 120),
                                  ButtonDialog(
                                      text: "Cansel",
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: const Color(0xffB03D3D),
                                      width: 120),
                                ],
                                contents: SizedBox(
                                    width: 400,
                                    child: Text(
                                      "Close ${control.Sessionss[index]['name']}",
                                      style: const TextStyle(fontSize: 16),
                                    )),
                                apptitle: "Close Session",
                                subtitle: "none"));
                          }
                        },
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: Theme.of(context).cardColor,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Center(
                                  child: Text(
                                    "${control.Sessionss[index]['name']!.replaceRange(4, 9, "").replaceRange(0, 2, "20\n")}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            const Color(0xff134B70).withOpacity(0.2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 60),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${control.Sessionss[index]['name']}",
                                        style: Theme.of(context).textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 20,
                                                )),
                                    Text(
                                        "${control.Sessionss[index]['status']}",
                                        style: Theme.of(context).textTheme.bodyMedium!
                                            .copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: control.Sessionss[index]
                                                      ['status'] ==
                                                  "Closed"
                                              ? const Color(0xffB03D3D)
                                              : const Color(0xff2F9742),
                                        )),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Start Date : ${control.Sessionss[index]['startDate']}",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                       )),
                                            Text(
                                                "End Date : ${control.Sessionss[index]['endDate']}",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      control.Sessionss[index]['hasStudents'] == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _iconButton(
                                  iconData: VMS_Icons.bin,
                                  color: const Color(0xffB03D3D),
                                  onPressed: () {
                                    Get.dialog(
                                      VMSAlertDialog(
                                        action: [
                                          ButtonDialog(
                                              text: "Delete",
                                              onPressed: () async {
                                                await Delete_Session_API(
                                                        context)
                                                    .Delete_Session(
                                                        sessionId:
                                                            control.Sessionss[
                                                                index]['id']);
                                              },
                                              color: const Color(0xffB03D3D),
                                              width: 120),
                                          ButtonDialog(
                                              text: "Cancel",
                                              onPressed: () async {},
                                              color: Theme.of(context).primaryColor,
                                              width: 120)
                                        ],
                                        contents: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 400,
                                              child: Text(
                                                "Do You Want To Delete (${control.Sessionss[index]['name']}) Session",
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        apptitle: "Delete Grade",
                                        subtitle: "none",
                                      ),
                                    );
                                  },
                                ),
                                _iconButton(
                                  iconData: Icons.edit_note_outlined,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    Get.find<SessionController>()
                                        .sessionController
                                        .text = control.Sessionss[index]
                                            ['name']
                                        .toString()
                                        .substring(0, 4);
                                    Get.find<SessionController>()
                                        .currentYear
                                        .value = int.parse(control
                                            .Sessionss[index]['name']
                                            .toString()
                                            .substring(0, 4)) +
                                        1;
                                    Get.find<SessionController>()
                                            .startDate
                                            .value =
                                        DateTime.parse(control.Sessionss[index]
                                            ['startDate']);
                                    Get.find<SessionController>()
                                            .endDate
                                            .value =
                                        DateTime.parse(control.Sessionss[index]
                                            ['endDate']);

                                    Get.dialog(VMSAlertDialog(
                                        action: [
                                          ButtonDialog(
                                              text: "Edit Session",
                                              onPressed: () async {
                                                await Edit_Session_API(context)
                                                    .Edit_Session(
                                                  sessionId: control
                                                      .Sessionss[index]['id'],
                                                  year:
                                                      "${Get.find<SessionController>().sessionController.text}-${int.parse(Get.find<SessionController>().sessionController.text) + 1}",
                                                  startDate: Get.find<
                                                          SessionController>()
                                                      .startDate
                                                      .value
                                                      .toString(),
                                                  endDate: Get.find<
                                                          SessionController>()
                                                      .endDate
                                                      .value
                                                      .toString(),
                                                );
                                              },
                                              color: Theme.of(context).primaryColor,
                                              width: 90)
                                        ],
                                        contents: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GetBuilder<SessionController>(
                                                builder: (controllers) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 220,
                                                    child:
                                                        Textfildwithupper_num(
                                                      Uptext: "Study Year",
                                                      hinttext: "Enter Year",
                                                      sessionController:
                                                          controllers
                                                              .sessionController,
                                                      borderColor: controllers
                                                          .borderColor,
                                                    ),
                                                  ),
                                                  Obx(() {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0),
                                                      child: Container(
                                                        height: 40,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "/${controllers.currentYear.value}",
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                            fontSize: 22,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              );
                                            }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                .only(
                                                                bottom: 5.0),
                                                        child:
                                                            Text("Start Date"),
                                                      ),
                                                      selectstart(
                                                        width: 220,
                                                        isRequired: true,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                                  bottom: 5.0),
                                                          child:
                                                              Text("End Date"),
                                                        ),
                                                        selectend(
                                                          width: 220,
                                                          isRequired: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        apptitle: "Edit Session",
                                        subtitle: "none"));
                                  },
                                ),
                              ],
                            )
                          : const Text("")
                    ],
                  ),
                );
              },
            )
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Theme.of(context).cardColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SchemaWidget(width: 120, height: 20),
                            SchemaWidget(width: 100, height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SchemaWidget(width: 120, height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child:
                                          SchemaWidget(width: 120, height: 20),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ))
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                        angle: 1,
                        color: Colors.grey.withOpacity(0.2),
                        duration: const Duration(seconds: 1),
                        delay: const Duration(seconds: 1));
              },
            );
    });
  }

  Widget _iconButton(
      {required IconData iconData,
      required Color color,
      required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 1),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        onPressed: onPressed,
        icon: Icon(iconData, size: 15, color: Colors.white),
      ),
    );
  }
}
