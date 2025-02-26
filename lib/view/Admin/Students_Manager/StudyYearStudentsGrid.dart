import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/getPenaltiesAndRewardsAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentPunishAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudyYearStudentGrid extends StatefulWidget {
  const StudyYearStudentGrid({super.key});

  @override
  State<StudyYearStudentGrid> createState() => _StudyYearStudentGridState();
}

class _StudyYearStudentGridState extends State<StudyYearStudentGrid>
    with SingleTickerProviderStateMixin {
  TextEditingController reason = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<StudyYearStudentsController>(builder: (controller) {
      return controller.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.2),
              itemCount: 8,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: Colors.white,
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
                                child: SchemaWidget(width: 50, height: 15),
                              ),
                              SchemaWidget(
                                width: 100,
                                height: 100,
                                radius: 100,
                              ),
                            ],
                          ),
                          SchemaWidget(width: 50, height: 15),
                          SchemaWidget(width: 50, height: 15),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(
                                  width: 25,
                                  height: 25,
                                  radius: 3,
                                ),
                                SchemaWidget(
                                  width: 25,
                                  height: 25,
                                  radius: 3,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    duration: const Duration(seconds: 2),
                    color: Get.theme.primaryColor.withOpacity(0.1));
              },
            )
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.2),
              itemCount: controller.filteredStudents!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    PenaltiesAndRewardsStudentModel model =
                        await Getpenaltiesandrewardsapi(context)
                            .Getpenaltiesandrewards(
                                controller.filteredStudents![index].id!);
                    Get.dialog(VMSAlertDialog(
                        action: [],
                        contents: SizedBox(
                            width: 600,
                            height: Get.height,
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TabBar(
                                    controller: _tabController,
                                    labelColor: Get.theme.primaryColor,
                                    unselectedLabelColor: Colors.grey,
                                    indicatorColor: Get.theme.primaryColor,
                                    indicatorWeight: 4.0,
                                    splashBorderRadius:
                                        BorderRadius.circular(10),
                                    dividerHeight: 0,
                                    tabs: [
                                      Tab(text: 'Rewards'),
                                      Tab(text: 'Penalties'),
                                    ],
                                  ),
                                  Expanded(
                                    child: GetBuilder<
                                            Penaltiesandrewardscontroller>(
                                        builder: (cont) {
                                      return TabBarView(
                                        controller: _tabController,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: DataTable(
                                                border: TableBorder.all(
                                                  color: Get.theme.primaryColor,
                                                  width: 1.0,
                                                ),
                                                columns: [
                                                  DataColumn(
                                                      label: Text('Season')),
                                                  DataColumn(
                                                      label: Text('Reward')),
                                                ],
                                                rows: const <DataRow>[
                                                  DataRow(cells: <DataCell>[
                                                    DataCell(Text('بيان 1')),
                                                    DataCell(Text('بيان 2')),
                                                  ]),
                                                  DataRow(cells: <DataCell>[
                                                    DataCell(Text('بيان 4')),
                                                    DataCell(Text('بيان 5')),
                                                  ]),
                                                  // يمكنك إضافة المزيد من الصفوف هنا
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: DataTable(
                                                  border: TableBorder.all(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    width: 1.0,
                                                  ),
                                                  columns: [
                                                    DataColumn(
                                                        label: Text('Penalty')),
                                                    DataColumn(
                                                        label:
                                                            Text('Start Date')),
                                                    DataColumn(
                                                        label:
                                                            Text('End Date')),
                                                    DataColumn(
                                                        label: Text('Reason')),
                                                  ],
                                                  rows: [
                                                    for (var i in model
                                                            .penaltyStudent ??
                                                        [])
                                                      DataRow(cells: [
                                                        DataCell(Text(i.penalty !=
                                                                    null &&
                                                                i.penalty!
                                                                    .isNotEmpty
                                                            ? i.penalty![0]
                                                                    .enName ??
                                                                "N/A"
                                                            : "N/A")),
                                                        DataCell(Text(
                                                            "${i.startDate ?? []}")),
                                                        DataCell(Text(
                                                            "${i.endDate ?? []}")),
                                                        DataCell(Text(
                                                            "${i.cause ?? []}")),
                                                      ])
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            )),
                        apptitle: "Penalties And Rewards",
                        subtitle: "none"));
                  },
                  child: HoverScaleCard(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.white,
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
                                  child: Text(
                                      "${controller.filteredStudents![index].fullName}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                ),
                                FutureBuilder(
                                  future: precacheImage(
                                      NetworkImage(
                                          "$getimage${controller.filteredStudents![index].fileId}"),
                                      context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return CircleAvatar(
                                        maxRadius: 60,
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        backgroundImage: controller
                                                    .filteredStudents![index]
                                                    .fileId !=
                                                null
                                            ? NetworkImage(
                                                "$getimage${controller.filteredStudents![index].fileId}")
                                            : null,
                                        child: controller
                                                    .filteredStudents![index]
                                                    .fileId ==
                                                null
                                            ? Text(
                                                controller
                                                    .filteredStudents![index]
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
                            Text("${controller.filteredStudents![index].state}",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    color: controller.filteredStudents![index]
                                                .state ==
                                            "Passing"
                                        ? const Color(0xff2F9742)
                                        : controller.filteredStudents![index]
                                                    .state ==
                                                "Failed"
                                            ? const Color(0xff972F2F)
                                            : const Color(0xff134B70))),
                            Text(
                                "Grade Level: ${controller.filteredStudents![index].grade!.enName}",
                                style: Get.theme.textTheme.bodyMedium),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                                  Colors.transparent),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3)),
                                            side: BorderSide(
                                                color: Get.theme.primaryColor),
                                          ))),
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(
                                            VMS_Icons.vcard,
                                            size: 14,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Text("First Season"),
                                          ),
                                        ],
                                      )),
                                  TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                                  Colors.transparent),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3)),
                                            side: BorderSide(
                                                color: Get.theme.primaryColor),
                                          ))),
                                      onPressed: () {
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                width: 90,
                                                onPressed: () async {
                                                  await Studentpunishapi(
                                                          context)
                                                      .Studentpunish(
                                                          Get.find<
                                                                  Dropdownpenaltycontroller>()
                                                              .penid!,
                                                          reason.text,
                                                          controller
                                                              .startdate.value
                                                              .toString(),
                                                          controller
                                                              .enddate.value
                                                              .toString(),
                                                          controller
                                                              .filteredStudents![
                                                                  index]
                                                              .id!);
                                                },
                                                color: Get.theme.primaryColor,
                                                text: "Send",
                                              )
                                            ],
                                            contents: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 350,
                                                ),
                                                GetBuilder<
                                                        Dropdownpenaltycontroller>(
                                                    builder: (PController) {
                                                  return DropDownStudyYearStudents(
                                                    isLoading:
                                                        PController.Isloading,
                                                    title: "Penalty",
                                                    type: "penalty",
                                                    width: w / 3.6,
                                                  );
                                                }),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("The Reason",
                                                          style: Get
                                                              .theme
                                                              .primaryTextTheme
                                                              .labelSmall),
                                                      Textfildwithupper(
                                                          Uptext: "The Reason",
                                                          isRequired: true,
                                                          width: w / 3.6,
                                                          controller: reason,
                                                          hinttext:
                                                              "The Reason"),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0,
                                                          bottom: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 5.0),
                                                        child: RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "Start Date",
                                                              style: Get
                                                                  .theme
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                              children: const [
                                                                TextSpan(
                                                                  text: " *",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                      penaltyStartDate(
                                                          width: w / 3.6)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0,
                                                          bottom: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("End Date",
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium!),
                                                      PenaltyEndDate(
                                                          width: w / 3.6)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            apptitle: "Punishing Student",
                                            subtitle: ""));
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(Icons.person_remove_outlined,
                                              size: 14),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Text("Punishing"),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
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
