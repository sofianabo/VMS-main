import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';

class DropDownEmployeeAttendence extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const DropDownEmployeeAttendence({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Employeeattendencecontroller>(builder: (cont) {
      String selectedValue = "";
      switch (type) {
        case 'jobTitle':
          selectedValue = cont.selectejobTitleIndex.isNotEmpty
              ? cont.selectejobTitleIndex
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
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                icon: selectedValue != title
                    ? GestureDetector(
                        onTap: () {
                          cont.selectIndex(type, "");
                        },
                        child: Icon(
                          Icons.close,
                          color: Get.theme.secondaryHeaderColor,
                        ),
                      )
                    : Icon(Icons.arrow_drop_down_outlined,
                        color: Get.theme.secondaryHeaderColor),
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                onChanged: (newValue) {
                  if (newValue != null) {
                    cont.selectIndex(type, newValue);
                  }
                },
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
      Employeeattendencecontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'jobTitle':
        items.addAll(cont.JobTitleList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
    }

    return items;
  }
}
