import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';

class DropDownTeacherStatus extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  bool isDisabled;
  bool isLoading;
  DropDownTeacherStatus({
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
    return GetBuilder<Allteacheratendencecontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'Class':
          selectedValue = cont.selectedclassIndex.isNotEmpty
              ? cont.selectedclassIndex
              : title;
          break;
        case 'Subject':
        selectedValue = cont.selectedSubjectIndex.isNotEmpty
            ? cont.selectedSubjectIndex
            : title;

        break;
        case 'Type':
        selectedValue = cont.selectedTypeIndex.isNotEmpty
            ? cont.selectedTypeIndex
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
        child: isDisabled == true?
        Row(
          children: [
            Text(title , style: const TextStyle(color: Colors.grey),),
          ],
        ):
        isLoading == true
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
                  }
                },
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                icon:  selectedValue.isNotEmpty && selectedValue != title
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

  List<DropdownMenuItem<String>> _getDropdownItems(Allteacheratendencecontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {

      case 'Class':
        items.addAll(cont.classlist.map((String value) {
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
        case 'Type':
        items.addAll(cont.Typelist.map((String value) {
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
        case 'Subject':
        items.addAll(cont.Subjectlist.map((String value) {
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
