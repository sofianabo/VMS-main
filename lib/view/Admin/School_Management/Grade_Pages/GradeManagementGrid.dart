import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Delete_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Edit_Grade_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GradeTable extends StatelessWidget {
  GradeTable({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController feeCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Grade_Controller>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width * 0.9,
          child: controller.isLoading == true
              ? LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).primaryColor,
                  size: 60,
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        border: TableBorder.all(
                            color: Theme.of(context).primaryColor),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                                color: Theme.of(context).indicatorColor),
                            children: [
                              _tableHeader('Operation', context),
                              _tableHeader('Fee Count', context),
                              _tableHeader('Grade Name', context),
                            ],
                          ),
                          for (var row in controller.Grades.asMap().entries)
                            TableRow(
                              children: [
                                _operationColumn(
                                    row.value, controller, row.key, context),
                                _dataColumn(row.value['feeCount'], context),
                                _dataColumn(row.value['enName'], context),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _tableHeader(String title, BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _operationColumn(
      Map row, Grade_Controller controller, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconButton(
            iconData: VMS_Icons.bin,
            color: const Color(0xffB03D3D),
            onPressed: () {
              Get.dialog(
                VMSAlertDialog(
                  action: [
                    ButtonDialog(
                        text: "Delete",
                        onPressed: () {
                          Delete_Grade_API(context).Delete_Grade(
                            gradeId: controller.Grades[index]['id'],
                            index: index,
                          );
                        },
                        color: const Color(0xffB03D3D),
                        width: 120),
                    ButtonDialog(
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                        color: Theme.of(context).primaryColor,
                        width: 120)
                  ],
                  contents: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 400,
                        child: Text(
                          "Do You Want To Delete (${row['enName']}) Grade",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  apptitle: "Delete Grade",
                  subtitle: "none",
                ),
              );
            },
          ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              name.text = "${row['name']}";
              enName.text = "${row['enName']}";
              feeCount.text = "${row['feeCount']}";
              Get.dialog(
                VMSAlertDialog(
                    action: [
                      ButtonDialog(
                          text: "Edit",
                          onPressed: () {
                            Edit_Grade_API(context).Edit_Grade(
                              gradeId: controller.Grades[index]['id'],
                              feeCount: feeCount.text,
                              enName: enName.text,
                              name: name.text,
                            );
                          },
                          color: Theme.of(context).primaryColor,
                          width: 120),
                    ],
                    contents: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Textfildwithupper(
                                  controller: enName,
                                  Uptext: "Grade En - Name",
                                  hinttext: "Grade En - Name"),
                            ),
                            Textfildwithupper(
                                controller: name,
                                Uptext: "Grade Ar - Name",
                                hinttext: "Grade Ar - Name"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15.0),
                              child: Textfildwithupper(
                                  controller: feeCount,
                                  Uptext: "Fee Count",
                                  hinttext: "Fee Count"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    apptitle: "Edit Grade",
                    subtitle: "none"),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _iconButton(
      {required IconData iconData,
      required Color color,
      required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 1),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        onPressed: onPressed,
        icon: Icon(iconData, size: 18, color: Colors.white),
      ),
    );
  }

  Widget _dataColumn(String? data, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Text(
        data ?? '',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
