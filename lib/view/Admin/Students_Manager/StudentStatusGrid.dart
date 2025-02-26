import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceByIdAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudentStatusGrid extends StatefulWidget {
  const StudentStatusGrid({super.key});

  @override
  State<StudentStatusGrid> createState() => _StudentStatusGridState();
}

class _StudentStatusGridState extends State<StudentStatusGrid> {
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentAttendencController>(
      builder: (control) {
        return control.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.5),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: SchemaWidget(width: 20, height: 15)),
                              ]),
                          SchemaWidget(width: 20, height: 15),
                        ],
                      ),
                    ),
                  );
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1))
            : GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.5),
                itemCount: control.filteredStudents.length,
                itemBuilder: (context, index) {
                  return HoverScaleCard(
                    child: GestureDetector(
                      onTap: () async {
                        OneStudentAttendenceModel attendanceModel =
                            await Studentattendencebyidapi(context)
                                .Studentattendencebyid(
                                    control.filteredStudents[index].studentId!);
                        Get.dialog(GetBuilder<Onestudentattendencecontroller>(
                          builder: (oneControl) {
                            return VMSAlertDialog(
                              action: [],
                              contents: SizedBox(
                                width: 600,
                                height: Get.height,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: Get.width,
                                      child: SingleChildScrollView(
                                        child: DataTable(
                                          border: TableBorder.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.0,
                                          ),
                                          columns: [
                                            DataColumn(
                                              label: Text(
                                                'Date',
                                                style: Get
                                                    .theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Status',
                                                style: Get
                                                    .theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Cause',
                                                style: Get
                                                    .theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                          rows: [
                                            for (var studentAttendance
                                                in attendanceModel.studentAt ??
                                                    [])
                                              DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                      studentAttendance.date ??
                                                          'N/A',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                  //status
                                                  DataCell(
                                                    Text(
                                                      studentAttendance
                                                              .status ??
                                                          'N/A',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      studentAttendance.cause ??
                                                          'N/A',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              apptitle:
                                  "${control.filteredStudents[index].fullName} Attendence ",
                              subtitle: "none",
                            );
                          },
                        ));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                          "${control.filteredStudents[index].fullName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                  FutureBuilder(
                                    future: precacheImage(
                                        NetworkImage(
                                            "$getimage${control.filteredStudents[index].fileId}"),
                                        context),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return CircleAvatar(
                                          maxRadius: 55,
                                          backgroundColor:
                                              const Color(0xffC4C4C4),
                                          backgroundImage: control
                                                      .filteredStudents[index]
                                                      .fileId !=
                                                  null
                                              ? NetworkImage(
                                                  "$getimage${control.filteredStudents[index].fileId}")
                                              : null,
                                          child: control.filteredStudents[index]
                                                      .fileId ==
                                                  null
                                              ? Text(
                                                  control
                                                      .filteredStudents[index]
                                                      .fullName!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: Get
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                          fontSize: 26,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                )
                                              : null,
                                        );
                                      } else {
                                        return CircleAvatar(
                                          maxRadius: 55,
                                          backgroundColor:
                                              const Color(0xffC4C4C4),
                                          child: LoadingAnimationWidget.inkDrop(
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 25,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ]),
                            Text("${control.filteredStudents[index].status}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16,
                                        color: control.filteredStudents[index]
                                                    .status ==
                                                "Present"
                                            ? const Color(0xff2F9742)
                                            : control.filteredStudents[index]
                                                        .status ==
                                                    "Truant"
                                                ? const Color(0xff972F2F)
                                                : control
                                                            .filteredStudents[
                                                                index]
                                                            .status ==
                                                        "Vacation"
                                                    ? const Color(0xffB27671)
                                                    : control
                                                                .filteredStudents[
                                                                    index]
                                                                .status ==
                                                            "Late"
                                                        ? const Color(
                                                            0xff349393)
                                                        : const Color(
                                                            0xff134B70))),
                            Expanded(
                              child: Text(
                                  "Grade Level: ${control.filteredStudents[index].grade!.enName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                      )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
