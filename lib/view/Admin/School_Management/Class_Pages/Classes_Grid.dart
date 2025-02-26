import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Delete_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Edit_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Functions/Class_Curriculm_Funcation.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ClassGrid extends StatelessWidget {
  ClassGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1),
              itemCount: 10,
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
                          SchemaWidget(width: 35, height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 20, height: 15),
                            ],
                          ),
                          SchemaWidget(width: 25, height: 15),
                          SchemaWidget(width: 25, height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SchemaWidget(width: 25, height: 15),
                              SchemaWidget(width: 20, height: 20),
                            ],
                          )
                        ],
                      )),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.grey.withOpacity(0.2),
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 1));
              },
            )
          : control.filteredreclasses!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.1),
                  itemCount: control.filteredreclasses!.length,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: GestureDetector(
                        onTap: () {
                          arName.text =
                              "${control.filteredreclasses![index].name}";
                          enName.text =
                              "${control.filteredreclasses![index].enName}";
                          driveUrl.text =
                              "${control.filteredreclasses![index].driveUrl}";
                          control.selectCurriculumsForClass(
                              control.filteredreclasses![index].curriculum);
                          Get.dialog(VMSAlertDialog(
                            action: [
                              ButtonDialog(
                                text: "Edit",
                                onPressed: () async {
                                  await Edit_Class_API(context).Edit_Class(
                                    name: arName.text,
                                    enName: enName.text,
                                    driveUrl: driveUrl.text,
                                    classId:
                                        control.filteredreclasses![index].id,
                                    curriculum: control.selectedCurriculums,
                                  );
                                },
                                color: Theme.of(context).primaryColor,
                                width: 120,
                              ),
                            ],
                            contents: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Textfildwithupper(
                                      width: 250,
                                      controller: enName,
                                      Uptext: "Grade En - Name",
                                      hinttext: "Grade En - Name",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          bottom: 15.0),
                                      child: Textfildwithupper(
                                        width: 250,
                                        controller: arName,
                                        Uptext: "Grade Ar - Name",
                                        hinttext: "Grade Ar - Name",
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Textfildwithupper(
                                      width: 250,
                                      controller: TextEditingController(
                                          text:
                                              "${control.filteredreclasses![index].grade!.enName}"),
                                      Uptext: "Grade",
                                      hinttext: "Grade",
                                      readOnly: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Textfildwithupper(
                                        width: 250,
                                        controller: TextEditingController(
                                            text:
                                                "${control.filteredreclasses![index].session!.year}"),
                                        Uptext: "Session",
                                        hinttext: "Session",
                                        readOnly: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                      child: Textfildwithupper(
                                        width: 250,
                                        controller: TextEditingController(
                                            text:
                                                "${control.filteredreclasses![index].admin!.userName}"),
                                        Uptext: "Admin Account",
                                        hinttext: "Admin Account",
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Text("Curriculums"),
                                            ),
                                            GestureDetector(
                                              onTap: () =>
                                                  Class_Curriculm_Funcation(
                                                      context),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 5.0, right: 5.0),
                                                width: 250,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xffB3B3B3)),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GetBuilder<
                                                            ClassMgmtController>(
                                                        builder: (controller) {
                                                      return Expanded(
                                                        child: Text(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          controller
                                                                  .selectedCurriculumNames
                                                                  .isNotEmpty
                                                              ? Get.find<
                                                                      ClassMgmtController>()
                                                                  .selectedCurriculumNames
                                                                  .join(', ')
                                                              : 'No selected curriculum', // هنا نعرض رسالة "لا يوجد مناهج مختارة" إذا كانت القائمة فارغة.
                                                        ),
                                                      );
                                                    }),
                                                    const Icon(
                                                        Icons.arrow_drop_down),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Textfildwithupper(
                                      width: 480,
                                      controller: driveUrl,
                                      Uptext: "Drive URL",
                                      hinttext: "Drive URL",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, top: 36.0),
                                      child: SvgPicture.asset(
                                        "../../images/drive.svg",
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            apptitle: "Edit Class",
                            subtitle: "none",
                          ));
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                control.filteredreclasses![index].hasStudent ==
                                        false
                                    ? Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1)
                                            ]),
                                        child: IconButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Color(0xffB03D3D)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                        text: "Delete",
                                                        onPressed: () async {
                                                          await Delete_Class_API(
                                                                  context)
                                                              .Delete_Class(
                                                                  classId: control
                                                                      .filteredreclasses![
                                                                          index]
                                                                      .id,
                                                                  index: index);
                                                          Get.back();
                                                        },
                                                        color: const Color(
                                                            0xffB03D3D),
                                                        width: 80),
                                                    ButtonDialog(
                                                        text: "Cancel",
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Theme.of(context)
                                                            .cardColor,
                                                        width: 80)
                                                  ],
                                                  contents: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 400,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Do You Want To Delete (${control.filteredreclasses![index].enName}) Class",
                                                            style: Get
                                                                .theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  apptitle: "Delete Class",
                                                  subtitle: "none"));
                                            },
                                            icon: const Icon(VMS_Icons.bin,
                                                size: 16, color: Colors.white)),
                                      )
                                    : Text(""),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${control.filteredreclasses![index].enName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 20,
                                            )),
                                  ],
                                ),
                                Text(
                                    "${control.filteredreclasses![index].grade!.enName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!),
                                Text(
                                    "${control.filteredreclasses![index].session!.year}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Drive URL",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 16,
                                            )),
                                    SvgPicture.asset(
                                      "../../images/drive.svg",
                                      width: 20,
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("No Classes",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
