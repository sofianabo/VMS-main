import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherStatusGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_Teachers/DropDownTeacherStatus.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';

class TeacherStatus extends StatefulWidget {
  const TeacherStatus({super.key});

  @override
  State<TeacherStatus> createState() => _TeacherStatusState();
}

class _TeacherStatusState extends State<TeacherStatus> {
  TextEditingController serch = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Getteacherattendenceapi(context).Getteacherattendence();
    Getallclassapi.getAllClasses();
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Row(
            children: [
              GetBuilder<Allteacheratendencecontroller>(builder: (controller) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropDownAllSessions(
                              title: "Session",
                              width: w / 3.5,
                              type: "session",
                              API: "Teachersts",
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownTeacherStatus(
                            isLoading: controller.isClassLoading,
                            width: w / 3.5,
                            title: "Class",
                            type: 'Class',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownTeacherStatus(
                            isLoading: controller.isSubjectLoading,
                            width: w / 3.5,
                            title: "Subject",
                            type: 'Subject',
                          ),
                        ),
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
                                style: const ButtonStyle(
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropDownTeacherStatus(
                              isLoading: false,
                              width: w / 3.5,
                              title: "Type",
                              type: 'Type',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: selectTeacherDateAttendence(
                              width: w / 3.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormSearch(
                              click: () {
                                controller.clearFilter();
                              },
                              onchange: (value) {
                                controller.searchRequestByName(
                                    value,
                                    controller.classIndex,
                                    controller.SubjectIndex,
                                    controller.TypeIndex);
                              },
                              width: w / 3.5,
                              radius: 5,
                              controller: serch,
                              suffixIcon:
                                  serch.text != "" ? Icons.clear : Icons.search,
                            ),
                          ),
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
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: Icon(VMS_Icons.xl,
                                      size: 18,
                                      color: Theme.of(context).highlightColor)),
                            ),
                          ),
                        ],
                      ),
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
          child: TeacherStatusGrid(),
        )),
      ],
    ));
  }
}
