import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Add_Curriculm_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Curriculum_Pages/Curriculum_Grid.dart';
import 'package:vms_school/widgets/Admin_School/DropDownCurriMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Curriculum_Management extends StatefulWidget {
  const Curriculum_Management({super.key});

  @override
  State<Curriculum_Management> createState() => _Curriculum_ManagementState();
}

class _Curriculum_ManagementState extends State<Curriculum_Management> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController enname = TextEditingController();

  TextEditingController max = TextEditingController();

  TextEditingController Passing = TextEditingController();

  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_All_Curriculm_API(context).Get_All_Curriculm();
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
                  Row(
                    children: [
                      GetBuilder<Subject_Controller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownCurriMgmt(
                            Isloading: controller.isLoading,
                            title: "Subject",
                            width: w / 4,
                            type: "Subject",
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDownCurriMgmt(
                          Isloading: false,
                          title: "Semester",
                          width: w / 4,
                          type: "semester",
                        ),
                      ),
                      GetBuilder<Curriculumn_Controller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(
                                  value,
                                  controller.semesterIndex,
                                  controller.subjectIndex);
                            },
                            width: w / 4,
                            radius: 5,
                            controller: search,
                            suffixIcon:
                                search.text != "" ? Icons.clear : Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
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
                            onPressed: () {
                              Get.dialog(GetBuilder<Curriculumn_Controller>(
                                  builder: (controller) {
                                return VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Add",
                                          onPressed: () async {
                                            await Add_Curriculm_API(context)
                                                .Add_Curriculm(
                                              name: name.text,
                                              Ename: enname.text,
                                              file:
                                                  controller.selectedFile.value,
                                              Image: controller
                                                  .selectedImage.value,
                                              maxMark: max.text,
                                              PassingMark: Passing.text,
                                              semesterId: controller.semesterId,
                                              subjectId: controller.subjectId,
                                              type: controller.isFailingSubject,
                                            );
                                            name.clear();
                                            max.clear();
                                            Passing.clear();
                                            controller.selectedFile.value!
                                                .clear();
                                            controller.selectedImage.value!
                                                .clear();
                                          },
                                          color: Theme.of(context).primaryColor,
                                          width: 90)
                                    ],
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 520,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GetBuilder<Subject_Controller>(
                                                builder: (controller) {
                                              return DropDownCurriMgmt(
                                                  Isloading:
                                                      controller.isLoading,
                                                  title: "Subject",
                                                  width: 250,
                                                  type: "Dialog_Subject");
                                            }),
                                            const DropDownCurriMgmt(
                                                title: "Semester",
                                                width: 250,
                                                type: "Dialog_semester")
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Textfildwithupper(
                                                  width: 250,
                                                  controller: name,
                                                  Uptext: "Name Curriculum",
                                                  hinttext: "Name Curriculum"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0),
                                                child: Textfildwithupper(
                                                    width: 250,
                                                    controller: enname,
                                                    Uptext:
                                                        "English Name Curriculum",
                                                    hinttext:
                                                        "English Name Curriculum"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Textfildwithupper(
                                                controller: max,
                                                Uptext: "Max Mark",
                                                hinttext: "Max Mark"),
                                            Textfildwithupper(
                                                controller: Passing,
                                                Uptext: "Passing Mark",
                                                hinttext: "Passing Mark")
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            children: [
                                              // Dropzone area for files and PDFs
                                              GestureDetector(
                                                onTap: () {
                                                  controller.pickPDFFile();
                                                },
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffD9D9D9)),
                                                    color: controller
                                                            .isHoveringFile
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: 250,
                                                  height: 100,
                                                  child: Stack(
                                                    children: [
                                                      DropzoneView(
                                                        operation:
                                                            DragOperation.copy,
                                                        cursor:
                                                            CursorType.Default,
                                                        onCreated:
                                                            (DropzoneViewController
                                                                controller) {
                                                          ctrl = controller;
                                                        },
                                                        onHover: () {
                                                          controller
                                                              .updateHoverFile(
                                                                  true);
                                                        },
                                                        onLeave: () {
                                                          controller
                                                              .updateHoverFile(
                                                                  false);
                                                        },
                                                        onDropFiles: (List<
                                                                DropzoneFileInterface>?
                                                            files) async {
                                                          if (files != null &&
                                                              files.length ==
                                                                  1) {
                                                            final file =
                                                                files.first;
                                                            final mimeType =
                                                                await ctrl
                                                                    ?.getFileMIME(
                                                                        file);
                                                            final fileName =
                                                                await ctrl
                                                                    ?.getFilename(
                                                                        file);
                                                            final fileBytes =
                                                                await ctrl
                                                                    ?.getFileData(
                                                                        file);

                                                            if (mimeType ==
                                                                    'application/pdf' ||
                                                                fileName!
                                                                    .toLowerCase()
                                                                    .endsWith(
                                                                        '.pdf')) {
                                                              controller
                                                                      .selectedFile
                                                                      .value =
                                                                  fileBytes;
                                                              controller
                                                                      .fileName
                                                                      .value =
                                                                  fileName!;
                                                              controller
                                                                  .updateTextFile(
                                                                      "PDF File Successfully Dropped!");
                                                            } else {
                                                              controller
                                                                  .updateTextFile(
                                                                      "Error: Unsupported File Type.");
                                                            }
                                                          } else {
                                                            controller
                                                                .updateTextFile(
                                                                    "Error: Only One File Is Allowed.");
                                                          }
                                                        },
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller.fileStatus,
                                                          style: TextStyle(
                                                            color: controller
                                                                    .isHoveringFile
                                                                ? Colors.white
                                                                : const Color(
                                                                    0xffCBBFBF),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.pickImage();
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  5)),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffD9D9D9)),
                                                      color: controller
                                                              .isHoveringimage
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : Colors.white,
                                                    ),
                                                    alignment: Alignment.center,
                                                    width: 250,
                                                    height: 100,
                                                    child: Stack(
                                                      children: [
                                                        DropzoneView(
                                                          operation:
                                                              DragOperation
                                                                  .copy,
                                                          cursor: CursorType
                                                              .Default,
                                                          onCreated:
                                                              (DropzoneViewController
                                                                  controller) {
                                                            ctrl = controller;
                                                          },
                                                          onHover: () {
                                                            controller
                                                                .updateHoverImage(
                                                                    true);
                                                          },
                                                          onLeave: () {
                                                            controller
                                                                .updateHoverImage(
                                                                    false);
                                                          },
                                                          onDropFiles: (List<
                                                                  DropzoneFileInterface>?
                                                              files) async {
                                                            if (files != null &&
                                                                files.length ==
                                                                    1) {
                                                              final file =
                                                                  files.first;
                                                              final mimeType =
                                                                  await ctrl
                                                                      ?.getFileMIME(
                                                                          file);
                                                              final fileName =
                                                                  await ctrl
                                                                      ?.getFilename(
                                                                          file);
                                                              final fileBytes =
                                                                  await ctrl
                                                                      ?.getFileData(
                                                                          file);
                                                              if (mimeType == 'image/jpeg' ||
                                                                  mimeType ==
                                                                      'image/png' ||
                                                                  fileName!
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          '.jpg') ||
                                                                  fileName
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          '.jpeg') ||
                                                                  fileName
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          '.png')) {
                                                                controller
                                                                        .selectedImage
                                                                        .value =
                                                                    fileBytes;
                                                                controller
                                                                    .updateTextImage(
                                                                        "Image Successfully Dropped!");
                                                              } else {
                                                                controller
                                                                    .updateTextImage(
                                                                        "Error: Unsupported File Type.");
                                                              }
                                                            } else {
                                                              controller
                                                                  .updateTextImage(
                                                                      "Error: Only One File Is Allowed.");
                                                            }
                                                          },
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller
                                                                .imageStatus,
                                                            style: TextStyle(
                                                              color: controller
                                                                      .isHoveringimage
                                                                  ? Colors.white
                                                                  : const Color(
                                                                      0xffCBBFBF),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text("Failing Subject"),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            value: controller
                                                                .isFailingSubject,
                                                            // Use the state from the controller
                                                            onChanged: (value) {
                                                              controller
                                                                  .updateSelection(
                                                                      value!); // Update the state
                                                            },
                                                          ),
                                                          const Text(
                                                              "Is Failing Subject"),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    apptitle: "Add Curriculum",
                                    subtitle: "none");
                              }));
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CurriculumGrid(),
        )),
      ],
    ));
  }
}
