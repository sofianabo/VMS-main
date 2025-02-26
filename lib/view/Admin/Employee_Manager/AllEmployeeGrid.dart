import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Delete_Employee.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Employee_By_Id_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/Get_Teacher_Illness.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AllEmployeeGrid extends StatelessWidget {
  const AllEmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allempolyeecontroller>(builder: (controller) {
      return controller.isLoading
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.4),
              itemCount: 8,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SchemaWidget(
                              width: 80,
                              height: 80,
                            ),
                            Expanded(
                                child: Center(
                              child: SchemaWidget(
                                width: 100,
                                height: 20,
                              ),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SchemaWidget(
                                          width: 20,
                                          height: 20,
                                        ),
                                        SchemaWidget(
                                          width: 100,
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 20,
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 20,
                                ),
                              ],
                            ),
                            SchemaWidget(
                              width: 60,
                              height: 60,
                              radius: 60,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200));
              },
            )
          : controller.filteredreemployees.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.4),
                  itemCount: controller
                      .filteredreemployees.length, // عدد العناصر في الشبكة
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: GestureDetector(
                          onTap: () async {
                            if (controller
                                    .filteredreemployees[index].hasEmployee ==
                                true) {
                              await GetEmployeeByIdApi.GetEmployeeById(
                                  employeeID: controller
                                      .filteredreemployees[index].id
                                      .toString(),
                                  context: context,
                                  index: index);
                            } else {
                              Get.dialog(BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(""),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(Icons.close_rounded,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  surfaceTintColor: Colors.transparent,
                                  insetPadding: EdgeInsets.zero,
                                  titlePadding: EdgeInsets.zero,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0,
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 20.0),
                                  actionsPadding: const EdgeInsets.all(15.0),
                                  content: Container(
                                    width: 400,
                                    height: 400,
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          "../../images/nodata.svg",
                                          width: 350,
                                          height: 350,
                                        ),
                                        Text(
                                          "This Teacher Does Not Contain Any Data",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            }
                          },
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  onPressed: () {
                                                    DeleteEmployee.DeleteEmployeeByID(
                                                        employeeID: controller
                                                            .filteredreemployees[
                                                                index]
                                                            .id
                                                            .toString());
                                                  },
                                                  color:
                                                      const Color(0xffB03D3D),
                                                  width: 80),
                                              ButtonDialog(
                                                  text: "Cancel",
                                                  onPressed: () {},
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 80)
                                            ],
                                            contents: SizedBox(
                                                width: 500,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Do You Want To Delete ${controller.employees[index].fullName} Employee",
                                                      style: Get
                                                          .theme
                                                          .primaryTextTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                  ],
                                                )),
                                            apptitle: "Delete Employee",
                                            subtitle: "none",
                                          ));
                                        },
                                        icon: const Icon(VMS_Icons.bin,
                                            size: 16, color: Colors.white)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: IconButton(
                                        style: ButtonStyle(
                                            iconSize:
                                                WidgetStateProperty.all(14),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Theme.of(context)
                                                        .primaryColorLight)),
                                        onPressed: () async {
                                          await Get_Teacher_Illness_API(context)
                                              .Get_Teacher_Illness(
                                                  teachId: int.parse(controller
                                                      .filteredreemployees[
                                                          index]
                                                      .id
                                                      .toString()),
                                                  index_of_Emp: index,
                                                  IsTeacher: false);
                                        },
                                        icon: const Icon(VMS_Icons.vir),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      "${controller.filteredreemployees[index].fullName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                    )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${controller.filteredreemployees[index].roll}",
                                              style: Get
                                                  .theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: controller
                                                                  .filteredreemployees[
                                                                      index]
                                                                  .roll ==
                                                              "Accountant"
                                                          ? const Color(
                                                              0xff2684FC)
                                                          : controller
                                                                      .filteredreemployees[
                                                                          index]
                                                                      .roll ==
                                                                  "Sub Admin"
                                                              ? const Color(
                                                                  0xff297686)
                                                              : controller
                                                                          .filteredreemployees[
                                                                              index]
                                                                          .roll ==
                                                                      "Registration"
                                                                  ? const Color(
                                                                      0xffB27671)
                                                                  : controller.filteredreemployees[index].roll ==
                                                                          "Supervisor"
                                                                      ? const Color(
                                                                          0xff2F9742)
                                                                      : Get
                                                                          .theme
                                                                          .primaryColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                controller
                                                            .filteredreemployees[
                                                                index]
                                                            .roll ==
                                                        "Accountant"
                                                    ? Icons
                                                        .account_balance_wallet_outlined
                                                    : controller
                                                                .filteredreemployees[
                                                                    index]
                                                                .roll ==
                                                            "Sub Admin"
                                                        ? Icons
                                                            .manage_accounts_outlined
                                                        : controller
                                                                    .filteredreemployees[
                                                                        index]
                                                                    .roll ==
                                                                "Registration"
                                                            ? Icons
                                                                .app_registration
                                                            : controller
                                                                        .filteredreemployees[
                                                                            index]
                                                                        .roll ==
                                                                    "Supervisor"
                                                                ? Icons
                                                                    .supervised_user_circle_outlined
                                                                : Icons
                                                                    .admin_panel_settings_outlined,
                                                color: controller
                                                            .filteredreemployees[
                                                                index]
                                                            .roll ==
                                                        "Accountant"
                                                    ? const Color(0xff2684FC)
                                                    : controller
                                                                .filteredreemployees[
                                                                    index]
                                                                .roll ==
                                                            "Sub Admin"
                                                        ? const Color(
                                                            0xff297686)
                                                        : controller
                                                                    .filteredreemployees[
                                                                        index]
                                                                    .roll ==
                                                                "Registration"
                                                            ? const Color(
                                                                0xffB27671)
                                                            : controller
                                                                        .filteredreemployees[
                                                                            index]
                                                                        .roll ==
                                                                    "Supervisor"
                                                                ? const Color(
                                                                    0xff2F9742)
                                                                : Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "${controller.filteredreemployees[index].jobTitle}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${controller.filteredreemployees[index].salary}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    FutureBuilder(
                                      future: precacheImage(
                                          NetworkImage(
                                              "$getimage${controller.filteredreemployees[index].imageId}"),
                                          context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return CircleAvatar(
                                            maxRadius: 60,
                                            backgroundColor:
                                                const Color(0xffC4C4C4),
                                            backgroundImage: controller
                                                        .filteredreemployees[
                                                            index]
                                                        .imageId !=
                                                    null
                                                ? NetworkImage(
                                                    "$getimage${controller.filteredreemployees[index].imageId}")
                                                : null,
                                            child: controller
                                                        .filteredreemployees[
                                                            index]
                                                        .imageId ==
                                                    null
                                                ? Text(
                                                    controller
                                                        .filteredreemployees[
                                                            index]
                                                        .fullName!
                                                        .substring(0, 1)
                                                        .toUpperCase(),
                                                    style: Get
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )
                                                : null,
                                          );
                                        } else {
                                          return CircleAvatar(
                                            maxRadius: 60,
                                            backgroundColor:
                                                const Color(0xffC4C4C4),
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 30,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )
              : Center(
                  child: Text("No Employees",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
