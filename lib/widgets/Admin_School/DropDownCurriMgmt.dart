import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';

class DropDownCurriMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? Isloading;

  const DropDownCurriMgmt({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
    this.Isloading,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Curriculumn_Controller>(builder: (cont) {
      String currentValue = selectedValue ?? title;

      switch (type) {
        case 'Subject':
          currentValue =
              cont.selectsubjectIndex.isNotEmpty ? cont.selectsubjectIndex : title;
          break;

        case 'semester':
          currentValue = cont.selectsemesterIndex.isNotEmpty
              ? cont.selectsemesterIndex
              : title;
          break;

          case 'Dialog_Subject':
          currentValue = cont.selectdialog_SubjectIndex.isNotEmpty
              ? cont.selectdialog_SubjectIndex
              : title;
          break;

          case 'Dialog_semester':
          currentValue = cont.selectdialog_SemesterIndex.isNotEmpty
              ? cont.selectdialog_SemesterIndex
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
        child: Isloading == true
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
                    cont.selectIndex(type, newValue);
                    switch (type) {
                      case 'Dialog_Subject':
                       cont.set_subjectIdx(Get.find<Subject_Controller>().subject!.firstWhere((subg) => subg.enName  == newValue || subg.name  == newValue).id);
                        break;
                      case 'Dialog_semester':
                        if(newValue == "The First Semester"){
                          cont.set_semesteridx(1);
                        }
                        if(newValue == "The Second Semester"){
                          cont.set_semesteridx(2);
                        }
                        if(newValue == "The Third Semester"){
                          cont.set_semesteridx(3);
                        }
                        break;
                    }
                  }
                },
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: currentValue,
                isExpanded: true,
                underline: const SizedBox(),
                icon: currentValue != title
                    ? GestureDetector(
                  onTap: () {
                    cont.selectIndex(type, "");
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
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                items: [
                  DropdownMenuItem<String>(
                    value: title,
                    enabled: false,
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
      Curriculumn_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'Subject':
        items.addAll(cont.listsubject.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'semester':
        items.addAll(cont.listSemester.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'Dialog_Subject':
        items.addAll(cont.list_Dialog_Subject.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'Dialog_semester':
        items.addAll(cont.list_Dialog_semester.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

    }

    return items;
  }
}
