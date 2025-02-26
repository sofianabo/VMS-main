import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Transaction_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Transaction_Controller.dart';

class DropDowTransaction extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? read;
  final bool? isLoading;

  const DropDowTransaction({
    super.key,
    required this.title,
    this.color,
    this.read,
    required this.isLoading,
    required this.width,
    required this.type,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Transaction_Controller>(builder: (cont) {
      String currentValue = selectedValue ?? title;
      switch (type) {
        case 'roll':
          currentValue = cont.selectedrollIndex.isNotEmpty
              ? cont.selectedrollIndex
              : title;
        case 'action':
          currentValue = cont.selectedactionIndex.isNotEmpty
              ? cont.selectedactionIndex
              : title;
        case 'rows':
          currentValue = cont.selectedrowsIndex.isNotEmpty
              ? cont.selectedrowsIndex
              : title;
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
        child: isLoading == true
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
                      value: currentValue,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: currentValue != title
                          ? GestureDetector(
                              onTap: () {
                                if (type == "rows") {
                                  if (cont.rowsIndex != "25") {
                                    Get_Transaction_Screen_API
                                        .Get_Transaction_Screen(rows: "25");
                                    cont.selectIndex("rows", "25");
                                  }
                                } else {
                                  cont.selectIndex(type, "");
                                }
                                cont.update();
                              },
                              child: Icon(
                                type == "rows"
                                    ? cont.rowsIndex == "25"
                                        ? Icons.arrow_drop_down
                                        : Icons.close
                                    : Icons.close,
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
      Transaction_Controller cont) {
    List<DropdownMenuItem<String>> items = [];
    switch (type) {
      case 'roll':
        items.addAll(cont.rolllist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'action':
        items.addAll(cont.actionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'rows':
        items.addAll(cont.rowslist.map((String value) {
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
