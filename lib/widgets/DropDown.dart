// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDownController.dart';

class DropDown extends StatelessWidget {
  double width;
  String title = "";
  Color? COLOR;
  List<String> options = [];

  DropDown(
      {super.key,
      required this.width,
      required this.title,
      this.COLOR,
      required this.options});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropDownController>(builder: (cont) {
      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: COLOR ?? const Color(0xffD9D9D9)),
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.black,
          value: cont.selectedIndex,
          underline: const Text(""),
          icon: const Expanded(
            child: Row(
              children: [
                Spacer(),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          style:Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
          onChanged: (newValue) {
            cont.selectval(newValue!);
          },
          items: [
            DropdownMenuItem<String>(
              value: "",
              enabled: false,
              child: Text(
                title,
                style: Get.theme.textTheme.bodyMedium!
                    .copyWith(fontSize: 14),
              ),
            ),
            ...cont.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14),
                ),
              );
            }),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }
}
