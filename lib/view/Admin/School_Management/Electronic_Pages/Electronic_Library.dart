import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Add_E_Book_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Electronic_Pages/Electronic_Book_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ElectronicBook extends StatefulWidget {
  const ElectronicBook({super.key});

  @override
  State<ElectronicBook> createState() => _ElectronicBookState();
}

class _ElectronicBookState extends State<ElectronicBook> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_All_E_Book_API(context).Get_All_E_Book();
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
                      GetBuilder<Labrary_Controller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(
                                value
                              );
                            },
                            width: w * 0.7,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty ? Icons.close :  Icons.search,
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
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(
                                  GetBuilder<Labrary_Controller>(
                                    builder: (controller) {
                                      return VMSAlertDialog(
                                      contents:Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 400,
                                          ),
                                          Textfildwithupper(
                                              width: 350,
                                              controller: name,
                                              Uptext: "Name",
                                              hinttext: "Name"),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Textfildwithupper(
                                                width: 350,
                                                controller: enName,
                                                Uptext: "English Name",
                                                hinttext: "English Name"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.pickPDFFile();
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(milliseconds: 500),
                                                decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                  border: Border.all(color: const Color(0xffD9D9D9)),
                                                  color: controller.isHoveringFile ? Theme.of(context).primaryColor : Colors.white,
                                                ),
                                                alignment: Alignment.center,
                                                width: 350,
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
                                                        controller.updateHoverFile(true);
                                                      },
                                                      onLeave: () {
                                                        controller.updateHoverFile(false);
                                                      },
                                                      onDropFiles: (List<DropzoneFileInterface>? files) async {
                                                        if (files != null && files.length == 1) {
                                                          final file = files.first;
                                                          final mimeType = await ctrl?.getFileMIME(file);
                                                          final fileName = await ctrl?.getFilename(file);
                                                          final fileBytes = await ctrl?.getFileData(file);

                                                          if (mimeType == 'application/pdf' || fileName!.toLowerCase().endsWith('.pdf')) {
                                                            controller.selectedFile.value = fileBytes;
                                                            controller.fileName.value = fileName!;
                                                            controller.updateTextFile("PDF File Successfully Dropped!");
                                                          }else {
                                                            controller.updateTextFile("Error: Unsupported File Type.");
                                                          }
                                                        } else {
                                                          controller.updateTextFile("Error: Only One File Is Allowed.");
                                                        }
                                                      },
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        textAlign: TextAlign.center,
                                                        controller.fileStatus,
                                                        style: TextStyle(
                                                          color: controller.isHoveringFile ? Colors.white : const Color(0xffCBBFBF),
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
                                      action: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ButtonDialog(
                                                width: 150,
                                                text: "Add Book",
                                                onPressed: () async {
                                                 await Add_E_Book_API(context).Add_E_Book(
                                                    file: controller.selectedFile.value,
                                                    name: name.text,
                                                   enName: enName.text,
                                                  );
                                                 controller.selectedFile.value!.clear();
                                                 name.clear();
                                                },
                                                color:
                                                    Theme.of(context).colorScheme.primary)
                                          ],
                                        )
                                      ],
                                      apptitle: "Add Electronic Book",
                                      subtitle: "none");
                                    }
                                  ));
                            },
                            icon: Icon(Icons.add,
                                size: 18, color: Theme.of(context).highlightColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                                  size: 18, color: Theme.of(context).highlightColor)),
                        ),
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Theme.of(context).highlightColor)),
                        ),
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
          child: ElectronicBookGrid(),
        )),
      ],
    ));
  }
}
