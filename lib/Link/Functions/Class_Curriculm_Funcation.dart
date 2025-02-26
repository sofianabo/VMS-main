import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Class_Curriculm_Funcation(BuildContext context) async {
  TextEditingController search = TextEditingController();
  try {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    if (await Get_All_Curriculm_API(context)
            .Get_All_Curriculm(canceltoken: cancelToken) ==
        200) {
      Get.back();
      Get.dialog(GetBuilder<ClassMgmtController>(builder: (control) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          control.resetSelections();
        });

        return VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Done",
                onPressed: () {
                  Get.back();
                },
                color: Get.theme.primaryColor,
                width: 65),
          ],
          contents: Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: SizedBox(
              width: 700,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          click: () {
                            control.clearFilter();
                          },
                          onchange: (value) {
                            control.searchByName(value);
                          },
                          width: 680,
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.7,
                      ),
                      itemCount: control.filteredCurriculum.length,
                      itemBuilder: (context, index) {
                        final curriculum = control.filteredCurriculum[index];
                        final isSelected =
                            control.selectedCurriculums.contains(curriculum.id);

                        return GestureDetector(
                          onTap: () {
                            control.toggleSelection(curriculum.id!);
                          },
                          child: HoverScaleCard(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: isSelected
                                    ? Get.theme.primaryColor
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        "${curriculum.enName}",
                                        textAlign: TextAlign.center,
                                        style: Get.theme.textTheme.bodyMedium!
                                            .copyWith(
                                          fontSize: 18,
                                          color: isSelected
                                              ? Colors.white
                                              : Get.theme.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          apptitle: "Students Vaccine",
          subtitle: "none",
        );
      }));
    }
  } catch (e) {
    Get.back();
    print("Error: $e");
  }
}
