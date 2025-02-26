import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Get_All_Vaccines_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Students_Vaccines_Funcation(BuildContext context) async {
  TextEditingController search = TextEditingController();
  try {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    if (await Get_Vaccines_API(context)
            .Get_Vaccines(cancelToken: cancelToken) ==
        200) {
      Get.back();
      Get.dialog(VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Done",
                onPressed: () {
                  Get.back();
                },
                color: Theme.of(context).primaryColor,
                width: 65)
          ],
          contents: Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: SizedBox(
              width: 700,
              child: GetBuilder<Vaccines_Controller>(builder: (control) {
                return Column(
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
                            )),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.9,
                        ),
                        itemCount: control.filteredvaccine!.length,
                        itemBuilder: (context, index) {
                          final Vaccines = control.filteredvaccine![index];
                          final isSelected = control.isSelected(Vaccines);
                          final hasOldFile = control.finalList.any((entry) =>
                              entry['id'] == Vaccines.id &&
                              entry.containsKey('hasOldFile') &&
                              entry['hasOldFile'] == true);
                          final hasNewFile = control.finalList.any((entry) =>
                              entry['id'] == Vaccines.id &&
                              entry.containsKey('hasNewFile') &&
                              entry['hasNewFile'] == true);
                          return HoverScaleCard(
                            child: GestureDetector(
                              onTap: () {
                                control.toggleSelection(
                                  Vaccines,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
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
                                          textAlign: TextAlign.center,
                                          "${control.filteredvaccine![index].enName}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 18,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("${control.getFileName(Vaccines)}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Theme.of(context)
                                                            .primaryColor)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, right: 5.0),
                                              child: Container(
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Get
                                                            .theme.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          offset: Offset(0, 2),
                                                          blurRadius: 1)
                                                    ]),
                                                child: IconButton(
                                                    style: ButtonStyle(
                                                        shape: WidgetStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))))),
                                                    onPressed: control.hasFile(
                                                            Vaccines)
                                                        ? () {
                                                            control.removeFile(
                                                                Vaccines);
                                                          }
                                                        : () {},
                                                    icon: Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        size: 20,
                                                        color: isSelected
                                                            ? control.hasFile(
                                                                    Vaccines)
                                                                ? Theme.of(context)
                                                                    .primaryColor
                                                                : Colors.grey
                                                            : Colors.white)),
                                              ),
                                            ),
                                            // Container(
                                            //   margin: EdgeInsets.only(
                                            //       left: 5.0, right: 5.0),
                                            //   width: 35,
                                            //   height: 35,
                                            //   decoration: BoxDecoration(
                                            //       color: isSelected
                                            //           ? Colors.white
                                            //           : Theme.of(context).primaryColor,
                                            //       borderRadius:
                                            //           BorderRadius.circular(5),
                                            //       boxShadow: const [
                                            //         BoxShadow(
                                            //             color: Colors.black12,
                                            //             offset: Offset(0, 2),
                                            //             blurRadius: 1)
                                            //       ]),
                                            //   child: IconButton(
                                            //       style: ButtonStyle(
                                            //           shape: WidgetStatePropertyAll(
                                            //               RoundedRectangleBorder(
                                            //                   borderRadius: BorderRadius
                                            //                       .all(Radius
                                            //                           .circular(
                                            //                               5))))),
                                            //       onPressed: () {},
                                            //       icon: Icon(
                                            //           Icons
                                            //               .file_download_outlined,
                                            //           size: 20,
                                            //           color: Colors.white)),
                                            // ),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.white
                                                    : Theme.of(context).primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 2),
                                                    blurRadius: 1,
                                                  )
                                                ],
                                              ),
                                              child: IconButton(
                                                style: ButtonStyle(
                                                  shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  control.attachFile(
                                                    Vaccines,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.file_upload_outlined,
                                                  size: 20,
                                                  color: isSelected
                                                      ? Theme.of(context).primaryColor
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
          apptitle: "Students Vaccine",
          subtitle: "none"));
    }
  } catch (e) {}
}
