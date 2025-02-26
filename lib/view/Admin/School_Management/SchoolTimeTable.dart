import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddLessonAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/widgets/Admin_Table/DropDownSchoolTime.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class SchoolTimeTable extends StatefulWidget {
  const SchoolTimeTable({super.key});

  @override
  State<SchoolTimeTable> createState() => _SchoolTimeTableState();
}

Map<String, int> days = {
  "Sunday": 0,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4
};
Map<int, String> lessions = {
  1: 'First\n Lesson',
  2: 'second\n Lesson',
  3: 'Third\n Lesson',
  4: 'Forth\n Lesson',
  5: 'Fifth\n Lesson',
  6: 'Sixth\n Lesson',
  7: 'Seventh\n Lesson',
};
List<Map<String, String>> tableData = [
  {
    'Day': 'Sunday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Monday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Tuesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Wednesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Thursday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
];

class Pair<F, S> {
  late final F first;
  late final S second;
  Pair(this.first, this.second);
  F getKey() {
    return first;
  }

  S getVal() {
    return second;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Pair<F, S>) return false;
    return first == other.first && other.second == second;
  }

  @override
  String toString() {
    return 'pair($first,$second)';
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

Map<Pair<int, int>, int> indexes = {};

SchoolTimeModel? m;

class _SchoolTimeTableState extends State<SchoolTimeTable> {
  @override
  void initState() {
    Getallclassapi.getAllClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<AdminSchoolTimeController>(
                  builder: (controller) {
                return Row(
                  children: [
                    DropDownSchoolTime(
                      type: "time",
                      title: "Time",
                      width: Get.width / 4,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: DropDownSchoolTime(
                        isDisabled: false,
                        isLoading: controller.isLoadingClass,
                        type: "class",
                        title: "Class",
                        width: Get.width / 4,
                      ),
                    ),
                    DropDownSchoolTime(
                      isLoading: controller.isLoadingDivision,
                      isDisabled:
                          controller.examClassIndex == "" ? true : false,
                      type: "division",
                      title: "Division",
                      width: Get.width / 4,
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Container(
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
                            onPressed: () {},
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ),
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
                          onPressed: () {},
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        GetBuilder<AdminSchoolTimeController>(builder: (controller) {
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: controller.examClassIndex == ""
                ? Center(
                    child: Text(
                    "Select Class First",
                    style:
                        Get.textTheme.titleLarge!.copyWith(fontSize: 22),
                  ))
                : controller.examDivisionIndex == ""
                    ? Center(
                        child: Text(
                        "Select Division First",
                        style: Get.textTheme.titleLarge!
                            .copyWith(fontSize: 22),
                      ))
                    : controller.isLoading
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color: Theme.of(context).primaryColor,
                              size: 60,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0),
                            child: SingleChildScrollView(
                                child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Table(
                                      border: TableBorder.all(
                                          color: Get.theme.primaryColor),
                                      children: [
                                        TableRow(
                                          children: [
                                            Container(
                                              height: 50,
                                              alignment: Alignment.center,
                                              color: Theme.of(context).indicatorColor,
                                              child: Center(
                                                child: Text('Day',
                                                    style:Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!.copyWith(fontSize: 18)),
                                              ),
                                            ),
                                            ...tableData[0]
                                                .keys
                                                .where(
                                                    (key) => key != 'Day')
                                                .map((key) => Container(
                                                      height: 50,
                                                      alignment: Alignment
                                                          .center,
                                                      color: Theme.of(context)
                                                          .indicatorColor,
                                                      child: Center(
                                                        child: Text(
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                            key,
                                                            style:Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium),
                                                      ),
                                                    )),
                                          ],
                                        ),
                                        for (var row in tableData)
                                          TableRow(
                                            children: [
                                              Container(
                                                alignment:
                                                    Alignment.center,
                                                height: 70,
                                                color: Theme.of(context).indicatorColor,
                                                child: Center(
                                                  child: Text(
                                                      row['Day'] ?? '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ),
                                              ),
                                              ...row.entries
                                                  .where((entry) =>
                                                      entry.key != 'Day')
                                                  .map(
                                                      (entry) =>
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              if (m!.studyShare!
                                                                      .isEmpty &&
                                                                  controller
                                                                      .examDivision
                                                                      .isEmpty) {
                                                              } else {
                                                                CancelToken
                                                                    cancelToken =
                                                                    CancelToken();
                                                                Loading_Dialog(
                                                                    cancelToken:
                                                                        cancelToken);
    
                                                                AllTeacherModel
                                                                    teacher =
                                                                    await Getallteachersapi
                                                                        .Getallteachers();
                                                                controller
                                                                    .setAllTeacherDialog(
                                                                        teacher);
                                                                Get.back();
                                                                Get.dialog(VMSAlertDialog(
                                                                    action: [
                                                                      entry.value.contains("No Lesson")
                                                                          ? ButtonDialog(
                                                                              text: "Add",
                                                                              onPressed: () async {
                                                                                final entryIndex = row.entries
                                                                                    .toList() // تحويل الكائنات إلى قائمة
                                                                                    .indexWhere((e) => e.value == entry.value); // البحث عن الفهرس
    
                                                                                await Addlessonapi(context).Addlesson(controller.subjectDialogList.indexOf(controller.selectedSubjectDialog), controller.examDivision.indexOf(controller.selectedExamDivision), controller.timeLessonIndex, controller.teacherDialogList.indexOf(controller.selectedTeacherDialog), entryIndex, row['Day'].toString());
                                                                              },
                                                                              color: Get.theme.primaryColor,
                                                                              width: 120)
                                                                          : ButtonDialog(
                                                                              text: "Edit",
                                                                              onPressed: () async {
                                                                                final entryIndex = row.entries
                                                                                    .toList() // تحويل الكائنات إلى قائمة
                                                                                    .indexWhere((e) => e.value == entry.value);
    
                                                                                Pair<int, int> key = Pair(days[row["Day"].toString()]!, entryIndex);
    
                                                                                int selectedId = indexes[key]!;
    
                                                                                await Editstudyshareapi(context).EditLesson(
                                                                                  controller.subjectDialogList.indexOf(controller.selectedSubjectDialog),
                                                                                  controller.teacherDialogList.indexOf(controller.selectedTeacherDialog),
                                                                                  selectedId,
                                                                                );
                                                                                Get.back();
                                                                              },
                                                                              color: Color.fromARGB(255, 2, 124, 49),
                                                                              width: 120),
                                                                      entry.value.contains("No Lesson")
                                                                          ? Container()
                                                                          : ButtonDialog(
                                                                              text: "Delete",
                                                                              onPressed: () async {
                                                                                final entryIndex = row.entries
                                                                                    .toList() // تحويل الكائنات إلى قائمة
                                                                                    .indexWhere((e) => e.value == entry.value);
                                                                                Pair<int, int> key = Pair(days[row["Day"].toString()]!, entryIndex);
    
                                                                                // البحث عن الفهرس
                                                                                int selectedId = indexes[key]!;
                                                                                await Deletestudyshareapi(context).Deletestudyshare(selectedId);
                                                                                Get.back();
                                                                              },
                                                                              color: Color(0xffB03D3D),
                                                                              width: 120),
                                                                    ],
                                                                    contents: Container(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(top: 15.0),
                                                                            child: Row(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 15.0),
                                                                                  child: DropDownSchoolTime(title: "Curriculm", width: 220, type: "subjectDialog"),
                                                                                ),
                                                                                DropDownSchoolTime(title: "Teacher", width: 220, type: "teacherDialog"),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    apptitle: "Operation of Lessons",
                                                                    subtitle: ""));
                                                              }
                                                            },
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                height: 70,
                                                                child: m!.studyShare!.isEmpty && controller.examDivision.isEmpty
                                                                    ? Text("")
                                                                    : entry.value.contains("No Lesson")!
                                                                        ? Icon(
                                                                            Icons.add_circle_outline,
                                                                            color: Get.theme.primaryColor,
                                                                          )
                                                                        : Text(textAlign: TextAlign.center, entry.value, style: Theme.of(context).textTheme.bodyMedium)),
                                                          )),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
          ));
        }),
      ],
    ));
  }
}
