import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Delete_Student_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Information.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Vaccines.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/view/Admin/Students_Manager/EditStudentInfo.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

import '../../../widgets/GridAnimation.dart';

class AllStudentGrid extends StatelessWidget {
  const AllStudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allstudentscontroller>(builder: (control) {
      return control.isLoading == false
          ? control.filteredStudents.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width <= 1278 && Get.width >= 1000
                          ? 3
                          : Get.width <= 999 && Get.width >= 759
                              ? 2
                              : Get.width <= 758
                                  ? 1
                                  : 4,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: Get.width <= 1410 && Get.width >= 1278
                          //THREE ITEMS
                          ? 0.8
                          : Get.width <= 1278 && Get.width >= 1149
                              //THREE ITEMS
                              ? 1.3
                              : Get.width <= 1148 && Get.width >= 1045
                                  ? 1.16
                                  : Get.width <= 999 && Get.width >= 759
                                      ? 1.2
                                      : Get.width <= 758 && Get.width >= 714
                                          ? 2.0
                                          : Get.width <= 713 && Get.width >= 569
                                              ? 1.6
                                              : Get.width <= 570
                                                  ? 1.3
                                                  //NORMAL ITEMS
                                                  : 0.95),
                  itemCount: control.filteredStudents.length,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${control.filteredStudents[index].fullName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  control.filteredStudents[index].fileId != null
                                      ? FutureBuilder(
                                          future: precacheImage(
                                            NetworkImage(
                                                "$getimage${control.filteredStudents[index].fileId}"),
                                            context,
                                          ),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                backgroundImage: NetworkImage(
                                                    "$getimage${control.filteredStudents[index].fileId}"),
                                              );
                                            } else {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      : CircleAvatar(
                                          maxRadius: 60,
                                          backgroundColor:
                                              const Color(0xffC4C4C4),
                                          child: Text(
                                            control.filteredStudents[index]
                                                .fullName!
                                                .substring(0, 1)
                                                .toUpperCase(),
                                            style: Get.textTheme.titleLarge!
                                                .copyWith(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              Text(
                                  "Mobile: ${control.filteredStudents[index].mobileNumber}",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  "Email: ${control.filteredStudents[index].email}",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  "Grade Level: ${control.filteredStudents[index].grade!.enName}",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  const Color(0xffB03D3D))),
                                      onPressed: () {
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                width: 100,
                                                text: "Delete",
                                                onPressed: () async {
                                                  await Delete_Student_API(
                                                          context)
                                                      .Delete_Student(
                                                          id: control
                                                              .filteredStudents[
                                                                  index]
                                                              .id
                                                              .toString());
                                                },
                                                color: const Color(0xffB03D3D),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              ButtonDialog(
                                                  width: 100,
                                                  text: "Cancel",
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  color: Theme.of(context)
                                                      .primaryColor)
                                            ],
                                            contents: SizedBox(
                                              width: 400,
                                              height: 1,
                                            ),
                                            apptitle: "Delete Students",
                                            subtitle:
                                                "Do You Want To Delete ${control.filteredStudents[index].fullName} Student"));
                                      },
                                      icon: const Icon(VMS_Icons.bin),
                                      color: Colors.white,
                                    ),
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColorLight)),
                                      onPressed: () async {
                                        Get.find<Illness_Controller>()
                                            .initialdata();
                                        await Get_Students_Illness_API(context)
                                            .Get_Students_Illness(
                                                studentId: control
                                                    .filteredStudents[index].id,
                                                index_of_Student: index);
                                      },
                                      icon: const Icon(VMS_Icons.vir),
                                      color: Colors.white,
                                    ),
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColorLight)),
                                      onPressed: () async {
                                        Get.find<Vaccines_Controller>()
                                            .initialdata();
                                        await Get_Students_Vacciness_API(
                                                context)
                                            .Get_Students_Vacciness(
                                                studentId: control
                                                    .filteredStudents[index].id,
                                                index_of_student: index);
                                      },
                                      icon: const Icon(VMS_Icons.dose),
                                      color: Colors.white,
                                    ),
                                    IconButton(
                                      style: ButtonStyle(
                                          maximumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          minimumSize: WidgetStateProperty.all(
                                              const Size(35, 35)),
                                          iconSize: WidgetStateProperty.all(14),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColorLight)),
                                      onPressed: () async {
                                        await Get_Students_Information_API(
                                                context)
                                            .Get_Students_Information(
                                                StudentsID: control
                                                    .filteredStudents[index].id,
                                                index: index);
                                      },
                                      icon: const Icon(VMS_Icons.vcard),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  },
                )
              : Center(
                  child: Text("No Students",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)))
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width <= 1278 && Get.width >= 1000
                      ? 3
                      : Get.width <= 999 && Get.width >= 759
                          ? 2
                          : Get.width <= 758
                              ? 1
                              : 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: Get.width <= 1410 && Get.width >= 1278
                      //THREE ITEMS
                      ? 0.8
                      : Get.width <= 1278 && Get.width >= 1149
                          //THREE ITEMS
                          ? 1.3
                          : Get.width <= 1148 && Get.width >= 1045
                              ? 1.16
                              : Get.width <= 999 && Get.width >= 759
                                  ? 1.2
                                  : Get.width <= 758 && Get.width >= 714
                                      ? 2.0
                                      : Get.width <= 713 && Get.width >= 569
                                          ? 1.6
                                          : Get.width <= 570
                                              ? 1.3
                                              //NORMAL ITEMS
                                              : 0.95),
              itemCount: 8,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: SchemaWidget(
                                width: 50,
                                height: 10,
                              )),
                              SchemaWidget(
                                width: 100,
                                height: 100,
                              )
                            ],
                          ),
                          SchemaWidget(
                            width: 60,
                            height: 10,
                          ),
                          SchemaWidget(
                            width: 55,
                            height: 10,
                          ),
                          SchemaWidget(
                            width: 30,
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200));
              },
            );
    });
  }
}
