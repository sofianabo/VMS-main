import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/widgets/GridAnimation.dart';

class DashboardSecondSide extends StatelessWidget {
  const DashboardSecondSide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Dashboard_Controller>(
      builder: (controller) {
        if (controller.Isloading) {
          return HoverScaleCard(
            child: Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Container(
                    width: 500,
                    height: 500,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Get.theme.cardColor,
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                  ),
                ),
              ],
            )),
          ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 1));
        }

        return HoverScaleCard(
          child: Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: Text("Total this year".tr),
                            ),
                            Column(
                              children: [
                                DashedCircularProgressBar.square(
                                  dimensions: 130,
                                  progress:
                                      controller.dsh!.percentageStudents == null
                                          ? 0
                                          : double.tryParse(controller
                                                  .dsh!.percentageStudents
                                                  .toString()) ??
                                              0,
                                  maxProgress: 100,
                                  startAngle: -27.5,
                                  foregroundColor: const Color(0xff006D77),
                                  backgroundColor: const Color(0xffE8DEF8),
                                  foregroundStrokeWidth: 10,
                                  backgroundStrokeWidth: 10,
                                  foregroundGapSize: 4,
                                  backgroundGapSize: 4,
                                  backgroundDashSize: 10,
                                  animation: true,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Percentage\nStudents".tr,
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(controller.dsh!
                                                      .percentageStudents ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageStudents}%"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: DashedCircularProgressBar.square(
                                    dimensions: 130,
                                    progress:
                                        controller.dsh!.percentageTeachers ==
                                                null
                                            ? 0
                                            : double.tryParse(controller
                                                    .dsh!.percentageTeachers
                                                    .toString()) ??
                                                0,
                                    maxProgress: 100,
                                    startAngle: -27.5,
                                    foregroundColor: const Color(0xff94C9A9),
                                    backgroundColor: const Color(0xffE8DEF8),
                                    foregroundStrokeWidth: 10,
                                    backgroundStrokeWidth: 10,
                                    foregroundGapSize: 4,
                                    backgroundGapSize: 4,
                                    backgroundDashSize: 10,
                                    animation: true,
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Percentage\nTeacher".tr,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(controller.dsh!
                                                        .percentageTeachers ==
                                                    null
                                                ? "0%"
                                                : "${controller.dsh!.percentageTeachers}%"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                DashedCircularProgressBar.square(
                                  dimensions: 130,
                                  progress:
                                      controller.dsh!.percentageEmployees ==
                                              null
                                          ? 0
                                          : double.tryParse(controller
                                                  .dsh!.percentageEmployees
                                                  .toString()) ??
                                              0,
                                  maxProgress: 100,
                                  startAngle: -27.5,
                                  foregroundColor: const Color(0xffB97375),
                                  backgroundColor: const Color(0xffE8DEF8),
                                  foregroundStrokeWidth: 10,
                                  backgroundStrokeWidth: 10,
                                  foregroundGapSize: 4,
                                  backgroundGapSize: 4,
                                  backgroundDashSize: 10,
                                  animation: true,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Percentage\nEmployee".tr,
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(controller.dsh!
                                                      .percentageEmployees ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageEmployees}%"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
        );
      },
    );
  }
}
