import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/EditGuardianAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../../widgets/GridAnimation.dart';

class AllGuardianGrid extends StatelessWidget {
  TextEditingController gUserName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  TextEditingController gphone = TextEditingController();
  AllGuardianGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allgaurdiancontroller>(builder: (control) {
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
                  crossAxisSpacing: 20.0,
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
              itemCount: Get.width <= 1226 && Get.width >= 988
                  ? 9
                  : Get.width <= 987 && Get.width >= 759
                      ? 6
                      : Get.width <= 758
                          ? 4
                          : 12,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: Theme.of(context).cardColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SchemaWidget(width: 30, height: 15),
                              ),
                            ],
                          ),
                          SchemaWidget(width: 40, height: 15),
                          SchemaWidget(width: 40, height: 15),
                        ],
                      )),
                );
              },
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 1))
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width <= 1226 && Get.width >= 988
                      ? 3
                      : Get.width <= 987 && Get.width >= 759
                          ? 2
                          : Get.width <= 758
                              ? 1
                              : 4,
                  crossAxisSpacing: 20.0,
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
              itemCount: control.filteredregaurdians!.length,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: GestureDetector(
                    onTap: () {
                      gUserName.text =
                          control.filteredregaurdians![index].name!;
                      gNationalID.text =
                          control.filteredregaurdians![index].nationalId!;
                      gEmail.text = control.filteredregaurdians![index].email!;
                      gphone.text = control.filteredregaurdians![index].phone!;

                      Get.dialog(VMSAlertDialog(
                          contents: SizedBox(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Guardian Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                      ),
                                      TextFieldDialog(
                                          controller: gUserName,
                                          hinttext:
                                              "${control.filteredregaurdians![index].name}")
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Guardian National ID",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!,
                                        ),
                                        TextFieldDialog(
                                            controller: gNationalID,
                                            hinttext:
                                                "${control.filteredregaurdians![index].nationalId}")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Guardian Email",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!,
                                        ),
                                        TextFieldDialog(
                                            controller: gEmail,
                                            hinttext:
                                                "${control.filteredregaurdians![index].email}")
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Guardian Phone Number",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!,
                                          ),
                                          TextFieldDialog(
                                              controller: gphone,
                                              hinttext:
                                                  "${control.filteredregaurdians![index].phone}")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                          action: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonDialog(
                                    width: 80,
                                    text: "Edit",
                                    onPressed: () async {
                                      await Editguardianapi(context)
                                          .Editguardian(
                                              control
                                                  .filteredregaurdians![index]
                                                  .id!,
                                              gUserName.text,
                                              gEmail.text,
                                              gNationalID.text,
                                              gphone.text,
                                              index);
                                      Get.back();
                                    },
                                    color:
                                        Theme.of(context).primaryColor)
                              ],
                            )
                          ],
                          apptitle: "Edit Guardian",
                          subtitle: "none"));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Theme.of(context).cardColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      "${control.filteredregaurdians![index].name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    "${control.filteredregaurdians![index].userName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!),
                              ],
                            ),
                            Text(
                                "Email: ${control.filteredregaurdians![index].email}",
                                style: Theme.of(context).textTheme.bodyMedium!),
                            Text(
                                "Mobile Number : ${control.filteredregaurdians![index].phone}",
                                style: Theme.of(context).textTheme.bodyMedium!),
                          ],
                        )),
                  ),
                );
              },
            );
    });
  }
}
