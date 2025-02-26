import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownAdminClassAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Add_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Class_Curriculm_Funcation.dart';
import 'package:vms_school/view/Admin/School_Management/Class_Pages/Classes_Grid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_School/DropDownClassMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ClassManagement extends StatefulWidget {
  const ClassManagement({super.key});

  @override
  State<ClassManagement> createState() => _ClassManagementState();
}

class _ClassManagementState extends State<ClassManagement> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Classes_API(context).Get_All_Classes();
    Getallgradeapi.Getallgrade();
    super.initState();
  }

  TextEditingController arName = TextEditingController();

  TextEditingController enName = TextEditingController();

  TextEditingController driveUrl = TextEditingController();
  final ClassMgmtController controllers = Get.put(ClassMgmtController());
  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  DropDownAllSessions(
                    title: "Session",
                    width: Get.width / 3,
                    type: "session",
                    API: 'class',
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GetBuilder<Dropdowngradecontroller>(
                          builder: (controller) {
                        return DropDownClassMgmt(
                            isLoading: controller.isLoading,
                            title: "Grade",
                            width: Get.width / 3,
                            type: "grade");
                      })),
                  const Spacer(),
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
                        style:  ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () async {
                          Get_Admin_Class_API(context).Get_Admin_Class();
                          Get.find<ClassMgmtController>()
                              .selectedCurriculumNames
                              .clear();
                          Get.find<ClassMgmtController>()
                              .selectedCurriculums
                              .clear();
                          Get.dialog(GetBuilder<ClassMgmtController>(
                              builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add",
                                      onPressed: () async {
                                        await Add_Class_API(context).Add_Class(
                                            gradeId: controller.grades,
                                            driveUrl: driveUrl.text,
                                            enName: enName.text,
                                            name: arName.text,
                                            sessionId: Get.find<
                                                    All_Screen_Sessions_Controller>()
                                                .sessions!
                                                .current!
                                                .id,
                                            userId: Get.find<
                                                    Virtual_Employee_Controller>()
                                                .vecUserID,
                                            curriculum:
                                                Get.find<ClassMgmtController>()
                                                    .selectedCurriculums);

                                        arName.clear();
                                        enName.clear();
                                        driveUrl.clear();
                                        Get.back();
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 120),
                                ],
                                contents: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                            width: 250,
                                            controller: enName,
                                            Uptext: "Class En - Name",
                                            hinttext: "Class En - Name"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 15.0),
                                          child: Textfildwithupper(
                                              width: 250,
                                              controller: arName,
                                              Uptext: "Class Ar - Name",
                                              hinttext: "Class Ar - Name"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        DropDownClassMgmt(
                                            isLoading: controller.isLoading,
                                            title: "Grade",
                                            width: 250,
                                            type: "gradediag"),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, right: 15.0),
                                            child: TextFieldDialog(
                                                readonly: true,
                                                width: 250,
                                                controller: TextEditingController(
                                                    text: Get.find<
                                                            All_Screen_Sessions_Controller>()
                                                        .sessions!
                                                        .current!
                                                        .year),
                                                hinttext: "Session")),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: GetBuilder<
                                                  Virtual_Employee_Controller>(
                                              builder: (VECcontroller) {
                                            return DropDownClassMgmt(
                                                isLoading:
                                                    VECcontroller.isLoading,
                                                title: "Admin Account",
                                                width: 250,
                                                type: "admin");
                                          }),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    Class_Curriculm_Funcation(
                                                        context),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5.0, right: 5.0),
                                                  margin: EdgeInsets.only(
                                                      left: 15.0),
                                                  width: 250,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffB3B3B3)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GetBuilder<
                                                              ClassMgmtController>(
                                                          builder:
                                                              (controller) {
                                                        return Expanded(
                                                          child: Text(
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(context).textTheme.bodyMedium,
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
                                                      const Icon(Icons
                                                          .arrow_drop_down),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                            width: 480,
                                            controller: driveUrl,
                                            Uptext: "Drive URL",
                                            hinttext: "Drive URL"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 36.0),
                                          child: SvgPicture.asset(
                                              "../../images/drive.svg",
                                              width: 25),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add Class",
                                subtitle: "none");
                          }));
                        },
                        icon: Icon(Icons.add,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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
                          style:  ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18, color: Theme.of(context).highlightColor)),
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
                        style:  ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {},
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ClassGrid(),
        )),
      ],
    ));
  }
}
