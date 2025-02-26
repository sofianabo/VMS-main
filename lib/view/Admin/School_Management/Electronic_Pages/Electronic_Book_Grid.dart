import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

import '../../../../Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Delete_Curriculm_API.dart';

class ElectronicBookGrid extends StatelessWidget {
  const ElectronicBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Labrary_Controller>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width <= 1226 && Get.width >= 988
                      ? 3
                      : Get.width <= 987 && Get.width >= 759
                          ? 2
                          : Get.width <= 758
                              ? 1
                              : 4,
                  crossAxisSpacing: 45.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: Get.width <= 1226 && Get.width >= 988
                      ? 2.2
                      : Get.width <= 987 && Get.width >= 759
                          ? 2.7
                          : Get.width <= 758 && Get.width >= 573
                              ? 3.8
                              : Get.width <= 573
                                  ? 3.0
                                  : 1.8),
              itemCount: 12,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              color: Theme.of(context).cardColor,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: Column(
                            children: [
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child:
                                          SchemaWidget(width: 40, height: 15),
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [SchemaWidget(width: 20, height: 20)],
                              )
                            ],
                          )),
                      Align(
                          alignment: const Alignment(-1.5, 2),
                          child: Image.asset(
                            "../../images/labrary3d.png",
                            height: 300,
                            color: Colors.grey.shade400,
                          )),
                    ],
                  ),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.grey.withOpacity(0.2),
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 1));
              },
            )
          : control.filteredEbook!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width <= 1226 && Get.width >= 988
                          ? 3
                          : Get.width <= 987 && Get.width >= 759
                              ? 2
                              : Get.width <= 758
                                  ? 1
                                  : 4,
                      crossAxisSpacing: 45.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: Get.width <= 1226 && Get.width >= 988
                          ? 2.2
                          : Get.width <= 987 && Get.width >= 759
                              ? 2.7
                              : Get.width <= 758 && Get.width >= 573
                                  ? 3.8
                                  : Get.width <= 573
                                      ? 3.0
                                      : 1.8),
                  itemCount: control.filteredEbook!.length,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: GestureDetector(
                        onTap: () {
                          final url =
                              '$getimage${control.filteredEbook![index].fileId}';
                          downloadFile(url, 'file.pdf');
                        },
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "${control.filteredEbook![index].enName}",
                                              style: const TextStyle(fontSize: 26),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Color(0xffB03D3D)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                action: [
                                                  ButtonDialog(
                                                      text: "Delete",
                                                      onPressed: () async {
                                                        await Delete_E_Book_API(
                                                                context)
                                                            .Delete_E_Book(
                                                                Eid: control
                                                                    .filteredEbook![
                                                                        index]
                                                                    .id);
                                                      },
                                                      color: const Color(0xffB03D3D),
                                                      width: 80),
                                                  ButtonDialog(
                                                      text: "Cancel",
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      color: Theme.of(context).primaryColor,
                                                      width: 80)
                                                ],
                                                contents: SizedBox(
                                                    width: 500,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Do You Want To Delete ( ${control.filteredEbook![index].enName} ) Book",
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    )),
                                                apptitle:
                                                    "Delete Electronic Book",
                                                subtitle: "none",
                                              ));
                                            },
                                            icon: const Icon(VMS_Icons.bin,
                                                size: 16, color: Colors.white)),
                                      ],
                                    )
                                  ],
                                )),
                            Align(
                                alignment: const Alignment(-1.5, 2),
                                child: Image.asset("../../images/labrary3d.png",
                                    height: 300)),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("No Electronic Book",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
