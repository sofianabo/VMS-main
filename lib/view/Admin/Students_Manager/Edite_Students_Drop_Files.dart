import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';

class Drop_Edite_students extends StatelessWidget {
  Drop_Edite_students({super.key});
  final controller = Get.find<Add_Students_Controller>();
  DropzoneViewController? ctrl;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allstudentscontroller>(builder: (add_controller) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Father Passport"),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: add_controller
                                                    .student!
                                                    .documantes!
                                                    .fatherPassport !=
                                                null
                                            ? Get.theme.primaryColor
                                            : Get.theme.disabledColor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 2),
                                              blurRadius: 1)
                                        ]),
                                    child: IconButton(
                                        onPressed: () {
                                          if (add_controller.student!
                                                  .documantes!.fatherPassport !=
                                              null) {
                                            final url =
                                                '$getimage${add_controller..student!.documantes!.fatherPassport!.id}';
                                            downloadFile(url,
                                                '${add_controller.filteredStudents[add_controller.idx].fullName!} Father Passport.${add_controller.student!.documantes!.fatherPassport!.fileType}');
                                          }
                                        },
                                        icon: Icon(
                                          Icons.file_download_outlined,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickFatherPassport();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringFatherPassport ||
                                    controller.selectedFatherPassport.value !=
                                        null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverFather(true);
                                },
                                onLeave: () {
                                  controller.updateHoverFather(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedFatherPassport.value =
                                        fileBytes;
                                    controller.FatherPassportName.value =
                                        fileName!;
                                    controller.updateTextFather(
                                        "File Father Passport Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child:
                                    controller.selectedFatherPassport.value !=
                                            null
                                        ? IconButton(
                                            onPressed: () {
                                              controller
                                                  .ClearselectedFatherPassport();
                                            },
                                            icon: Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.white,
                                            ))
                                        : Text(
                                            textAlign: TextAlign.center,
                                            controller.FatherPassportStatus,
                                            style: TextStyle(
                                              color: controller
                                                      .isHoveringFatherPassport
                                                  ? Colors.white
                                                  : Color(0xffCBBFBF),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mother Passport"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller.student!.documantes!
                                                .motherPassport !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller.student!.documantes!
                                              .motherPassport !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.motherPassport!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName!} Mother Passport.${add_controller.student!.documantes!.motherPassport!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickMotherPassport();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringMotherPassport ||
                                    controller.selectedMotherPassport.value !=
                                        null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverMother(true);
                                },
                                onLeave: () {
                                  controller.updateHoverMother(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedMotherPassport.value =
                                        fileBytes;
                                    controller.MotherPassportName.value =
                                        fileName!;
                                    controller.updateTextMother(
                                        "File Mother Passport Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child:
                                    controller.selectedMotherPassport.value !=
                                            null
                                        ? IconButton(
                                            onPressed: () {
                                              controller
                                                  .ClearselectedMotherPassport();
                                            },
                                            icon: Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.white,
                                            ))
                                        : Text(
                                            textAlign: TextAlign.center,
                                            controller.MotherPassportStatus,
                                            style: TextStyle(
                                              color: controller
                                                      .isHoveringMotherPassport
                                                  ? Colors.white
                                                  : Color(0xffCBBFBF),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Son Passport"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller.student!.documantes!
                                                .sonPassport !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller.student!.documantes!
                                              .sonPassport !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.sonPassport!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName!} son Passport.${add_controller.student!.documantes!.sonPassport!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickSonPassport();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringSonPassport ||
                                    controller.selectedSonPassport.value != null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverSon(true);
                                },
                                onLeave: () {
                                  controller.updateHoverSon(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedSonPassport.value =
                                        fileBytes;
                                    controller.SonPassportName.value =
                                        fileName!;
                                    controller.updateTextSon(
                                        "File Son Passport Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child: controller.selectedSonPassport.value !=
                                        null
                                    ? IconButton(
                                        onPressed: () {
                                          controller.Clear_Son();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                        ))
                                    : Text(
                                        textAlign: TextAlign.center,
                                        controller.SonPassportStatus,
                                        style: TextStyle(
                                          color:
                                              controller.isHoveringSonPassport
                                                  ? Colors.white
                                                  : Color(0xffCBBFBF),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID File"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller
                                                .student!.documantes!.userID !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller
                                              .student!.documantes!.userID !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.userID!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName!} userID.${add_controller.student!.documantes!.userID!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickId();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringId ||
                                    controller.selectedId.value != null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverId(true);
                                },
                                onLeave: () {
                                  controller.updateHoverId(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedId.value = fileBytes;
                                    controller.IdName.value = fileName!;
                                    controller.updateTextId("File Id Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child: controller.selectedId.value != null
                                    ? IconButton(
                                        onPressed: () {
                                          controller.Clear_id();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                        ))
                                    : Text(
                                        textAlign: TextAlign.center,
                                        controller.IdStatus,
                                        style: TextStyle(
                                          color: controller.isHoveringId
                                              ? Colors.white
                                              : Color(0xffCBBFBF),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Certificate"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller.student!.documantes!
                                                .certificate !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller.student!.documantes!
                                              .certificate !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.certificate!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName!} certificate.${add_controller.student!.documantes!.certificate!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickCertificate();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringCertificate ||
                                    controller.selectedCertificate.value != null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverCertificate(true);
                                },
                                onLeave: () {
                                  controller.updateHoverCertificate(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedCertificate.value =
                                        fileBytes;
                                    controller.CertificateName.value =
                                        fileName!;
                                    controller.updateTextCertificate(
                                        "File Certificate Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child: controller.selectedCertificate.value !=
                                        null
                                    ? IconButton(
                                        onPressed: () {
                                          controller.Clear_Certificate();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                        ))
                                    : Text(
                                        textAlign: TextAlign.center,
                                        controller.CertificateStatus,
                                        style: TextStyle(
                                          color:
                                              controller.isHoveringCertificate
                                                  ? Colors.white
                                                  : Color(0xffCBBFBF),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Academic sequence"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller.student!.documantes!
                                                .academicSequence !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller.student!.documantes!
                                              .academicSequence !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.academicSequence!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName} academicSequence.${add_controller.student!.documantes!.academicSequence!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.picktsalsol();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringtsalsol ||
                                    controller.selectedtsalsol.value != null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHovertsalsol(true);
                                },
                                onLeave: () {
                                  controller.updateHovertsalsol(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedtsalsol.value =
                                        fileBytes;
                                    controller.tsalsolName.value = fileName!;
                                    controller.updateTexttsalsol(
                                        "File Academic sequence Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child: controller.selectedtsalsol.value != null
                                    ? IconButton(
                                        onPressed: () {
                                          controller.Clear_tasalsol();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                        ))
                                    : Text(
                                        textAlign: TextAlign.center,
                                        controller.tsalsolStatus,
                                        style: TextStyle(
                                          color: controller.isHoveringtsalsol
                                              ? Colors.white
                                              : Color(0xffCBBFBF),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Family notebook"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: add_controller.student!.documantes!
                                                .familyNotebook !=
                                            null
                                        ? Get.theme.primaryColor
                                        : Get.theme.disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      if (add_controller.student!.documantes!
                                              .familyNotebook !=
                                          null) {
                                        final url =
                                            '$getimage${add_controller.student!.documantes!.familyNotebook!.id}';
                                        downloadFile(url,
                                            '${add_controller.filteredStudents[add_controller.idx].fullName} Family notebook.${add_controller.student!.documantes!.familyNotebook!.fileType}');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.pickFamilyBook();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Color(0xffD9D9D9)),
                            color: controller.isHoveringFamilyBook ||
                                    controller.selectedFamilyBook.value != null
                                ? Get.theme.primaryColor
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          child: Stack(
                            children: [
                              DropzoneView(
                                operation: DragOperation.copy,
                                cursor: CursorType.Default,
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverFamilyBook(true);
                                },
                                onLeave: () {
                                  controller.updateHoverFamilyBook(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
                                  if (files != null && files.length == 1) {
                                    final file = files.first;
                                    final fileName =
                                        await ctrl?.getFilename(file);
                                    final fileBytes =
                                        await ctrl?.getFileData(file);

                                    controller.selectedFamilyBook.value =
                                        fileBytes;
                                    controller.FamilyBookName.value = fileName!;
                                    controller.updateTextFamilyBook(
                                        "File Family NoteBook Dropped!");
                                  }
                                },
                              ),
                              Center(
                                child: controller.selectedFamilyBook.value !=
                                        null
                                    ? IconButton(
                                        onPressed: () {
                                          controller.Clear_FamilyBook();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.white,
                                        ))
                                    : Text(
                                        textAlign: TextAlign.center,
                                        controller.FamilyBookStatus,
                                        style: TextStyle(
                                          color: controller.isHoveringFamilyBook
                                              ? Colors.white
                                              : Color(0xffCBBFBF),
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
              ],
            ),
          ),
        ],
      );
    });
  }
}
