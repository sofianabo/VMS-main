import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/DeleteTeacherAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherById.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/Get_Teacher_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/getTeacherSubjectAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherManagementGrid extends StatelessWidget {
  const TeacherManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allteachercontroller>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width <= 1226 && Get.width >= 988
                      ? 3
                      : Get.width <= 987 && Get.width >= 759
                          ? 2
                          : Get.width <= 758
                              ? 1
                              : 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: Get.width <= 1226 && Get.width >= 988
                      ? 2.2
                      : Get.width <= 987 && Get.width >= 759
                          ? 2.7
                          : Get.width <= 758 && Get.width >= 573
                              ? 3.8
                              : Get.width <= 573
                                  ? 3.0
                                  : 0.9),
              itemCount: 12,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 10, right: 15.0),
                                  child: SchemaWidget(width: 60, height: 20),
                                ),
                              ),
                              SchemaWidget(
                                width: 120,
                                height: 120,
                                radius: 120,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SchemaWidget(width: 40, height: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SchemaWidget(width: 40, height: 20),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SchemaWidget(width: 130, height: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SchemaWidget(width: 90, height: 20),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(
                                width: 35,
                                height: 35,
                                radius: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: SchemaWidget(
                                  width: 35,
                                  height: 35,
                                  radius: 5,
                                ),
                              ),
                              SchemaWidget(
                                width: 35,
                                height: 35,
                                radius: 5,
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 1))
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width <= 1226 && Get.width >= 988
                      ? 3
                      : Get.width <= 987 && Get.width >= 759
                          ? 2
                          : Get.width <= 758
                              ? 1
                              : 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: Get.width <= 1226 && Get.width >= 988
                      ? 2.2
                      : Get.width <= 987 && Get.width >= 759
                          ? 2.7
                          : Get.width <= 758 && Get.width >= 573
                              ? 3.8
                              : Get.width <= 573
                                  ? 3.0
                                  : 0.9),
              itemCount: control.filteredTeacher!.length,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: GestureDetector(
                    onTap: () async {
                      if (control.filteredTeacher![index].hasEmployee == true) {
                        await GetteacherbyidAPI.Getteacherbyid(
                            TeacherId:
                                control.filteredTeacher![index].id.toString(),
                            context: context,
                            index: index);
                      } else {
                        Get.dialog(BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(""),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.close_rounded,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            surfaceTintColor: Colors.transparent,
                            insetPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            contentPadding: const EdgeInsets.only(
                                top: 0, left: 20.0, right: 20.0, bottom: 20.0),
                            actionsPadding: const EdgeInsets.all(15.0),
                            content: Container(
                              width: 400,
                              height: 400,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "../../images/nodata.svg",
                                    width: 350,
                                    height: 350,
                                  ),
                                  Text(
                                    "This Teacher Does Not Contain Any Data",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                      }
                    },
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        "${control.filteredTeacher![index].fullName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                FutureBuilder(
                                  future: precacheImage(
                                      NetworkImage(
                                          "$getimage${control.filteredTeacher![index].imageId}"),
                                      context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return CircleAvatar(
                                        maxRadius: 60,
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        backgroundImage: control
                                                    .filteredTeacher![index]
                                                    .imageId !=
                                                null
                                            ? NetworkImage(
                                                "$getimage${control.filteredTeacher![index].imageId}")
                                            : null,
                                        child: control.filteredTeacher![index]
                                                    .imageId ==
                                                null
                                            ? Text(
                                                control.filteredTeacher![index]
                                                    .fullName!
                                                    .substring(0, 1)
                                                    .toUpperCase(),
                                                style: Get.textTheme.titleLarge!
                                                    .copyWith(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )
                                            : null,
                                      );
                                    } else {
                                      return CircleAvatar(
                                        maxRadius: 60,
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        child: LoadingAnimationWidget.inkDrop(
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                      "${control.filteredTeacher![index].contractType}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: control
                                                          .filteredTeacher![
                                                              index]
                                                          .contractType ==
                                                      "Full Time"
                                                  ? const Color(0xff2F9742)
                                                  : Theme.of(context)
                                                      .primaryColor)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                      "${control.filteredTeacher![index].gender}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                  "Mobile : ${control.filteredTeacher![index].phone}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                      )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        "Email : ${control.filteredTeacher![index].email}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                            )),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    style: ButtonStyle(
                                        maximumSize: WidgetStateProperty.all(
                                            const Size(35, 35)),
                                        minimumSize: WidgetStateProperty.all(
                                            const Size(35, 35)),
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0xffB03D3D)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {
                                      Get.dialog(VMSAlertDialog(
                                        action: [
                                          ButtonDialog(
                                              text: "Delete",
                                              onPressed: () async {
                                                await Deleteteacherapi(context)
                                                    .Deleteteacher(control
                                                        .filteredTeacher![index]
                                                        .id!);
                                              },
                                              color: const Color(0xffB03D3D),
                                              width: 80),
                                          ButtonDialog(
                                              text: "Cancel",
                                              onPressed: () {
                                                Get.back();
                                              },
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 80)
                                        ],
                                        contents: SizedBox(
                                            width: 500,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Do You Want To Delete ( ${control.filteredTeacher![index].fullName} ) Teacher",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ],
                                            )),
                                        apptitle: "Delete Teacher",
                                        subtitle: "none",
                                      ));
                                    },
                                    icon: const Icon(VMS_Icons.bin,
                                        size: 16, color: Colors.white)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: IconButton(
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
                                      await Get_Teacher_Illness_API(context)
                                          .Get_Teacher_Illness(
                                              teachId: int.parse(control
                                                  .filteredTeacher![index].id
                                                  .toString()),
                                              index_of_Emp: index,
                                              IsTeacher: true);
                                    },
                                    icon: const Icon(VMS_Icons.vir),
                                    color: Colors.white,
                                  ),
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
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                      backgroundColor: WidgetStateProperty.all(
                                          Theme.of(context).primaryColorLight)),
                                  onPressed: () async {
                                    await Getteachersubjectapi(context)
                                        .Getteachersubject(
                                            control.filteredTeacher![index].id!,
                                            index);
                                  },
                                  icon: const Icon(Icons.subject),
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              },
            );
    });
  }
}
