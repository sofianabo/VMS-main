import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';

class DropDownStudentsAttendencemgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  bool isDisabled;
  bool isLoading;
  DropDownStudentsAttendencemgmt({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Student_attendence_controller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'grade':
          selectedValue = cont.selectedgradeIndex.isNotEmpty
              ? cont.selectedgradeIndex
              : title;
          break;
        case 'class':
          selectedValue = cont.selectedclassIndex.isNotEmpty
              ? cont.selectedclassIndex
              : title;
          break;
        case 'division':
          selectedValue = cont.selecteddivisionIndex.isNotEmpty
              ? cont.selecteddivisionIndex
              : title;
          break;
      }

      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
        ),
        child: isDisabled == true
            ? Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            : isLoading == true
                ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          onChanged: (newValue) {
                            if (newValue != null && newValue != title) {
                              cont.selectIndex(type, newValue);
                              if (type == 'grade') {
                                print(newValue);
                                if (newValue != title) {
                                  cont.resetOnGradeChange();
                                  Getallclassapi.getAllClasses(
                                    sessionID: Get.find<
                                            All_Screen_Sessions_Controller>()
                                        .sessionId,
                                    Gradeid: Get.find<Dropdowngradecontroller>()
                                        .gradess!
                                        .grades!
                                        .firstWhere((grad) =>
                                            grad.enName == newValue ||
                                            grad.name == newValue)
                                        .id,
                                  );
                                }
                              }
                              if (type == 'class') {
                                if (newValue != title) {
                                  Dropdowndivisionapi(context).Dropdowndivision(
                                      cont.classlist.indexOf(newValue), 0);
                                }
                              }
                              switch (type) {
                                case 'grade':
                                  IncreaseAttendanceAPI(context)
                                      .GetIncreaseAttendance(
                                    isserch: true,
                                    gradeid: Get.find<Dropdowngradecontroller>()
                                        .gradess!
                                        .grades!
                                        .firstWhere((grad) =>
                                            grad.enName == newValue ||
                                            grad.name == newValue)
                                        .id
                                        .toString(),
                                  );
                                  break;
                                case 'class':
                                  IncreaseAttendanceAPI(context)
                                      .GetIncreaseAttendance(
                                    isserch: true,
                                    classId: Get.find<Divisions_Controller>()
                                        .Classmodel!
                                        .classes!
                                        .firstWhere((cls) =>
                                            cls.enName == newValue ||
                                            cls.name == newValue)
                                        .id
                                        .toString(),
                                  );
                                  break;
                                case 'division':
                                  IncreaseAttendanceAPI(context)
                                      .GetIncreaseAttendance(
                                    isserch: true,
                                    divisionId:
                                        Get.find<Dropdowndivisioncontroller>()
                                            .allDivision
                                            .firstWhere((cls) =>
                                                cls.enName == newValue ||
                                                cls.name == newValue)
                                            .id
                                            .toString(),
                                  );
                                  break;
                              }
                            }
                          },
                          dropdownColor: Get.theme.cardColor,
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Get.theme.cardColor,
                          value: selectedValue,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: selectedValue.isNotEmpty &&
                                  selectedValue != title
                              ? GestureDetector(
                                  onTap: () {
                                    cont.selectIndex(type, "");
                                    if (type == "grade") {
                                      cont.resetOnGradeChange();
                                      IncreaseAttendanceAPI(context)
                                          .GetIncreaseAttendance(
                                        isserch: false,
                                      );
                                    }
                                    if (type == "class") {
                                      IncreaseAttendanceAPI(context)
                                          .GetIncreaseAttendance(
                                        isserch: true,
                                      );
                                    }
                                    if (type == "division") {
                                      print(Get.find<Divisions_Controller>()
                                          .Classmodel!
                                          .classes!
                                          .firstWhere((cls) =>
                                              cls.enName == cont.classIndex ||
                                              cls.name == cont.classIndex)
                                          .id
                                          .toString());
                                      IncreaseAttendanceAPI(context)
                                          .GetIncreaseAttendance(
                                              isserch: true,
                                              classId: Get.find<
                                                      Divisions_Controller>()
                                                  .Classmodel!
                                                  .classes!
                                                  .firstWhere((cls) =>
                                                      cls.enName ==
                                                          cont.classIndex ||
                                                      cls.name ==
                                                          cont.classIndex)
                                                  .id
                                                  .toString());
                                    }
                                    cont.update();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Get.theme.secondaryHeaderColor,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  color: Get.theme.secondaryHeaderColor,
                                ),
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 14),
                          items: [
                            DropdownMenuItem<String>(
                              value: title,
                              child: Text(
                                title,
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            ..._getDropdownItems(cont),
                          ],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Student_attendence_controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'grade':
        items.addAll(cont.gradelist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
