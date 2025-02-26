import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/DropDownPenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetStudyYearStudentAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudyYearStudentsGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class StudyYearStudents extends StatefulWidget {
  const StudyYearStudents({super.key});

  @override
  State<StudyYearStudents> createState() => _StudyYearStudentsState();
}

class _StudyYearStudentsState extends State<StudyYearStudents> {
  @override
  initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Study_Year_Students_API(context).Study_Year_Students();
    Get_All_Benality_API(context).Get_All_Benality();
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<StudyYearStudentsController>(builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownAllSessions(
                            API: "SYStudent",
                            title: "Session",
                            type: "session",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownStudyYearStudents(
                            isLoading: controller.isGradeLoading,
                            type: "grade",
                            title: "Grade",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownStudyYearStudents(
                            isDisabled:
                                controller.gradeIndex == "" ? true : false,
                            isLoading: controller.isClassLoading,
                            type: "class",
                            title: "Class",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownStudyYearStudents(
                            isLoading: controller.isDivisionLoading,
                            isDisabled:
                                controller.classIndex == "" ? true : false,
                            type: "division",
                            title: "Division",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(
                                  value,
                                  controller.gradeIndex,
                                  controller.classIndex,
                                  controller.divisionIndex);
                            },
                            width: w / 6.5,
                            radius: 5,
                            controller: search,
                            suffixIcon:
                                search.text != "" ? Icons.clear : Icons.search,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: IconButton(
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {},
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18, color: Get.theme.primaryColor)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudyYearStudentGrid(),
        )),
      ],
    ));
  }
}
