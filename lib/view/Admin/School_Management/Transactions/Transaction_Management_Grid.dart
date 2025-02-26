import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Delete_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Edit_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Transaction_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Transaction_Management_Grid extends StatelessWidget {
  const Transaction_Management_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Transaction_Controller>(builder: (control) {
      double size = 15;
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1),
              itemCount: 12,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 70, height: 10),
                              SchemaWidget(width: 70, height: 10)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [SchemaWidget(width: 70, height: 10)],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [SchemaWidget(width: 70, height: 10)],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 40, height: 10),
                              SchemaWidget(width: 70, height: 10),
                              SchemaWidget(width: 40, height: 10),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 70, height: 10),
                              SchemaWidget(width: 70, height: 10),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 70, height: 10),
                              SchemaWidget(width: 70, height: 10),
                              SchemaWidget(width: 70, height: 10),
                            ],
                          ),
                        ],
                      )),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.grey.withOpacity(0.2),
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 1));
              },
            )
          : control.filteredTransaction!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.1),
                  itemCount: control.filteredTransaction!.length,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: Container(
                          padding: const EdgeInsets.all(20),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range,
                                        size: 16,
                                      ),
                                      Text(
                                          " ${control.filteredTransaction![index].date}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_rounded,
                                        size: 16,
                                      ),
                                      Text(
                                          " ${control.filteredTransaction![index].time}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      "${control.filteredTransaction![index].userName}",
                                      style: Theme.of(context).textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.size.width / 6,
                                    child: Text(
                                        textAlign: TextAlign.center,
                                        "${control.filteredTransaction![index].detail}",
                                        style: Theme.of(context).textTheme.bodyMedium!
                                            .copyWith(
                                          fontSize: 14,
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("images/line.svg"),
                                  Text("Device Info",
                                      style: Theme.of(context).textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 14,
                                      )),
                                  SvgPicture.asset("images/line.svg"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        VMS_Icons.ip,
                                        size: size,
                                      ),
                                      Text(
                                          " ${control.filteredTransaction![index].ip}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                          control.filteredTransaction![index]
                                                  .browserVersion!
                                                  .toLowerCase()
                                                  .contains("edge")
                                              ? VMS_Icons.edge
                                              : control
                                                      .filteredTransaction![
                                                          index]
                                                      .browserVersion!
                                                      .contains("chrome")
                                                  ? VMS_Icons.Chrome
                                                  : control
                                                          .filteredTransaction![
                                                              index]
                                                          .browserVersion!
                                                          .contains("opera")
                                                      ? VMS_Icons.opera
                                                      : control
                                                              .transaction![
                                                                  index]
                                                              .browserVersion!
                                                              .contains(
                                                                  "safari")
                                                          ? VMS_Icons.safari
                                                          : control
                                                                  .transaction![
                                                                      index]
                                                                  .browserVersion!
                                                                  .contains(
                                                                      "fox")
                                                              ? VMS_Icons
                                                                  .firefox
                                                              : Icons.eco,
                                          size: size),
                                      Text(
                                          control.filteredTransaction![index]
                                                      .browserVersion!
                                                      .trim() !=
                                                  ""
                                              ? " ${control.filteredTransaction![index].browserVersion}"
                                              : "Unknow Browser",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                          control.filteredTransaction![index]
                                                  .platform!
                                                  .toLowerCase()
                                                  .contains("windows")
                                              ? VMS_Icons.windows
                                              : control
                                                      .filteredTransaction![
                                                          index]
                                                      .platform!
                                                      .toLowerCase()
                                                      .contains("android")
                                                  ? VMS_Icons.android
                                                  : control
                                                              .filteredTransaction![
                                                                  index]
                                                              .platform!
                                                              .toLowerCase()
                                                              .contains(
                                                                  "ios") ||
                                                          control
                                                              .transaction![
                                                                  index]
                                                              .platform!
                                                              .toLowerCase()
                                                              .contains(
                                                                  "apple") ||
                                                          control
                                                              .transaction![
                                                                  index]
                                                              .platform!
                                                              .toLowerCase()
                                                              .contains("mac")
                                                      ? VMS_Icons.apple
                                                      : Icons
                                                          .running_with_errors,
                                          size: size),
                                      Text(
                                          " ${control.filteredTransaction![index].platform}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                          control.filteredTransaction![index]
                                                  .deviceType!
                                                  .toLowerCase()
                                                  .contains("phone")
                                              ? VMS_Icons.phone
                                              : control
                                                      .filteredTransaction![
                                                          index]
                                                      .deviceType!
                                                      .toLowerCase()
                                                      .contains("tablet")
                                                  ? VMS_Icons.tablet
                                                  : VMS_Icons.desktop,
                                          size: size),
                                      Text(
                                          " ${control.filteredTransaction![index].deviceType}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(VMS_Icons.admin, size: size),
                                      Text(
                                          " ${control.filteredTransaction![index].roll}",
                                          style: Theme.of(context).textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  },
                )
              : Center(
                  child: Text("No Transactions",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
